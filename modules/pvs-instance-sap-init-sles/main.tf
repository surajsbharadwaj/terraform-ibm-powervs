#####################################################
# PowerVs Instance Initialization for SLES Configuration
# Copyright 2022 IBM
#####################################################

locals {
  private_key = var.ssh_private_key
}


#####################################################
# Add VPC route to the PVS instance
# Copyright 2022 IBM
#####################################################

resource "null_resource" "configure_vpc_route" {

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.bastion_public_ip
    host         = var.host_private_ip
    private_key  = local.private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [
    
    ###### Add route for Pinging between VPC VSI and PVS VSI always ######
    "if [ -n '${var.vpc_address_prefix}' ]; then echo \"${var.vpc_address_prefix} $( ip route list | awk ' /^default/ {print $3}') - -\" > /etc/sysconfig/network/ifroute-eth0; fi",
	 
	  ##### SET eth0 MTU to 1450 for routing traffic to internet (eth0 has to be a management network)
	  "grep -qxF \"MTU='1450'\" /etc/sysconfig/network/ifcfg-eth0 || sed -i '/^MTU=/cMTU=1450' /etc/sysconfig/network/ifcfg-eth0",
    "grep -qxF \"ETHTOOL_OPTIONS='-K iface rx off '\" /etc/sysconfig/network/ifcfg-eth0 || echo \"ETHTOOL_OPTIONS='-K eth0 rx off'\" >> /etc/sysconfig/network/ifcfg-eth0",
    "/usr/bin/systemctl restart network ", 

    ]
  }
}

#####################################################
# SNAT configutaion
# Copyright 2022 IBM
#####################################################

resource "null_resource" "configure_snat" {
  count         = var.pvs_bastion_snat_config["required"] ? 1 : 0
  depends_on    = [null_resource.configure_vpc_route]

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.bastion_public_ip
    host         = var.host_private_ip
    private_key  = local.private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [
    
    #### SNAT CLIENT CONFIG (eth0 has to be a management network) ####

    "if [ -n '${var.pvs_bastion_snat_config["pvs_bastion_private_ip"]}' ]; then echo \"${var.pvs_bastion_snat_config["pvs_bastion_private_ip"]} $( ip route list | awk ' /^default/ {print $3}') - -\" > /etc/sysconfig/network/ifroute-eth0; fi",
    "grep -qxF \"NETCONFIG_DNS_STATIC_SERVERS=\"9.9.9.9\"\" /etc/sysconfig/network/config || sed -i '/^NETCONFIG_DNS_STATIC_SERVERS=/cNETCONFIG_DNS_STATIC_SERVERS=\"9.9.9.9\"' /etc/sysconfig/network/config",
    "rm -rf /etc/resolv.conf",    
    "/usr/bin/systemctl restart network ", 

    ]
  }
}

#####################################################
# Forward Proxy squid configutaion
# Copyright 2022 IBM
#####################################################

resource "null_resource" "configure_proxy" {
  count          = var.vpc_bastion_proxy_config["required"] ? 1 : 0
  depends_on     = [null_resource.configure_vpc_route]

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.bastion_public_ip
    host         = var.host_private_ip
    private_key  = local.private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [

    #######  SQUID Forward PROXY CLIENT SETUP ############

    "if [ -n '${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}' ]; then echo \"export http_proxy=http://${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}:3128\"  >> /etc/bash.bashrc; fi",
    "if [ -n '${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}' ]; then echo \"export https_proxy=http://${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}:3128\" >> /etc/bash.bashrc; fi",
    "if [ -n '${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}' ]; then echo \"export HTTP_proxy=http://${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}:3128\"  >> /etc/bash.bashrc; fi",
    "if [ -n '${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}' ]; then echo \"export HTTPS_proxy=http://${var.vpc_bastion_proxy_config["vpc_bastion_private_ip"]}:3128\" >> /etc/bash.bashrc; fi",
    "if [ -n '${var.vpc_bastion_proxy_config["no_proxy_ips"]}' ]; then echo \"export no_proxy='${var.vpc_bastion_proxy_config["no_proxy_ips"]}'\" >> /etc/bash.bashrc; fi",
    "if [ -n '${var.vpc_bastion_proxy_config["no_proxy_ips"]}' ]; then echo \"export NO_PROXY='${var.vpc_bastion_proxy_config["no_proxy_ips"]}'\" >> /etc/bash.bashrc; fi",
    "/usr/bin/systemctl restart network ", 

    ]
  }
}

#####################################################
# SUSE Registration
# Copyright 2022 IBM
#####################################################

resource "null_resource" "suse_register" {
  count         = var.suse_activation["required"] ? 1 : 0
  depends_on    = [null_resource.configure_proxy,null_resource.configure_snat]

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.bastion_public_ip
    host         = var.host_private_ip
    private_key  = local.private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [
    
    ##### Register SUSE and PACKAGES INSTALLATON #####
    "mv /etc/SUSEConnect /etc/SUSEConnect.bkpp 2>/dev/null || :",
    "SUSEConnect -d &> /dev/null || true :",
    "SUSEConnect --cleanup",
    "SUSEConnect -r ${var.suse_activation["activation_code"]} -e ${var.suse_activation["activation_email"]}",
    "SUSEConnect -p sle-module-public-cloud/12/ppc64le",

    ]
  }
}

#####################################################
# Install Necessary Packages
# Copyright 2022 IBM
#####################################################

resource "null_resource" "install_packages" {
  depends_on    = [null_resource.suse_register] 

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.bastion_public_ip
    host         = var.host_private_ip
    private_key  = local.private_key
    agent        = false
    timeout      = "15m"
  }

  provisioner "remote-exec" {
    inline = [
    
    ##### Ansible Install #####
	
    "zypper install -y python-pip",
    "pip install ansible ",

    ]
  }
}


#####################################################
# Execute ANsbile galaxy role to prepare the system 
  for SAP installation
# Copyright 2022 IBM
#####################################################

locals{
  disks_config = { for key,value in var.pvs_instance_storage_config :  key => split(",",var.pvs_instance_storage_config[key]) }
}

resource "null_resource" "execute_ansible_role" {
  depends_on = [null_resource.install_packages]

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = var.bastion_public_ip
    host         = var.host_private_ip
    private_key  = local.private_key
    agent        = false
    timeout      = "15m"
  }
  
  provisioner "file" {
    
    #### Write the disks wwns and other variables required for ansible roles to file under /root/terraform_vars.yml  ####
	  
    content     = <<EOF
disks_configuration : ${jsonencode(local.disks_config)}
SAP_SOLUTION : '${var.sap_solution}'
terraform_wrapper : True
host_ip: '${var.host_private_ip}'
EOF

   destination = "terraform_vars.yml"
  }

  provisioner "remote-exec" {
    inline = [

    ####  Execute ansible roles: prepare_sles_sap, fs_creation and swap_creation  ####

    "ansible-galaxy install sahityajain123.power_linux_sap_prepare",
    "unbuffer ansible-playbook --connection=local -i 'localhost,' ~/.ansible/roles/sahityajain123.power_linux_sap_prepare/playbook-sles.yml --extra-vars '@/root/terraform_vars.yml' 2>&1 | tee ansible_execution.log ",
    ]
  }

} 
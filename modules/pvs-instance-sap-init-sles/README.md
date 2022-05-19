# Module pvs-instance-sap-init-sles

This module configures the PVS instance and prepares the system for SAP installation. 
- Add routes to VPC
- Configure SNAT
- COnfigure Forward Proxy
- SUSE Registeration
- Install Packages
- Run ansible galaxy roles 

## Example Usage
```

module "instance-sap-init-sles" {
  source = "terraform-ibm-modules/powervs/ibm//modules/pvs-instance-sap-init-sles"

  bastion_public_ip            = var.bastion_public_ip
  host_private_ip              = var.host_private_ip
  ssh_private_key              = var.ssh_private_key
  vpc_address_prefix           = var.vpc_address_prefix
  pvs_bastion_snat_config      = { 
                                   required               = var.pvs_bastion_snat_config[required]
                                   pvs_bastion_private_ip = var.pvs_bastion_private_ip[pvs_bastion_private_ip]                              }
  vpc_bastion_proxy_config     = {
                                   required               = var.vpc_bastion_proxy_config[required] 
                                   vpc_bastion_private_ip = var.vpc_bastion_proxy_config[vpc_bastion_private_ip]
                                   no_proxy_ips           = var.vpc_bastion_proxy_config[no_proxy_ips]
                                 }
  suse_activation              = var.suse_activation                                
  pvs_instance_storage_config  = var.pvs_instance_storage_config
  sap_solution                 = var.sap_solution
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| bastion_public_ip | Public IP of Bastion Host | string | n/a | yes |
| host_private_ip | Private IP of Netweaver/HANA Host reachable from bastion | string | n/a | yes |
| ssh_private_key | Private Key to confgure Instance, Will not be uploaded to server | string | n/a | yes |
| vpc_address_prefix | Existing Address prefix of VPC to reach the HANA/NW node from machine on vpc | string | n/a | yes |
| pvs_bastion_snat_config | SNAT configuration if required on HANA/nw node to reach public internet via the Bastion host on Power Server | map | {
                    required = false
                    pvs_bastion_private_ip = ""
                  } | yes |
| vpc_bastion_proxy_config | SQUID configuration if required on HANA/nw node to reach public internet via the Bastion host on VSI running SQUID server | map | {
                    required = true
                    vpc_bastion_private_ip = ""
                    no_proxy_ips           = ""
                  } | optional |
| suse_activation | Suse activation email and code to register for suse | map | {
                    required         = false
                    activation_email = ""
                    activation_code  = ""
                  } | yes |
| pvs_instance_storage_config | Disks properties to create filesystems | map | {
                    names      = ""
                    paths      = ""
                    disks_size = ""
                    counts     = ""
                    wwns       = ""
  } | yes |
| sap_solution | To Execute Playbooks for Hana or Netweaver. Value can be either HANA OR NETWEAVER | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
module "pvs_sap_init_sles_hana" {
  source                       = "../../modules/pvs-instance-sap-init-sles"

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
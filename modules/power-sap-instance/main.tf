#####################################################
# PVS SAP instance Configuration
# Copyright 2022 IBM
#####################################################


module "import-image" {
  source                         = "./power-image-import"
  count                          = var.brownfield ? 1 : 0

  pvs_zone                       = var.pvs_zone
  pvs_resource_group_name        = var.pvs_resource_group_name
  pvs_service_name               = var.pvs_service_name
  pvs_image_name                 = var.pvs_instance_image_name
}

module "instance-sap" {
  source                         = "./power-instance"
  depends_on                     = [module.import-image]
  
  pvs_zone                       = var.pvs_zone
  pvs_resource_group_name        = var.pvs_resource_group_name
  pvs_service_name               = var.pvs_service_name
  pvs_instance_hostname          = var.pvs_instance_hostname
  pvs_sshkey_name                = var.pvs_sshkey_name
  pvs_instance_image_name        = var.pvs_instance_image_name
  pvs_instance_profile_id        = var.pvs_instance_profile_id
  pvs_instance_sys_type          = var.pvs_instance_sys_type
  pvs_instance_proc_type         = var.pvs_instance_proc_type
  pvs_instance_processors        = var.pvs_instance_processors
  pvs_instance_memory            = var.pvs_instance_memory
  pvs_instance_private_net_names = var.pvs_instance_private_net_names
  pvs_instance_private_net_ids   = var.pvs_instance_private_net_ids
  pvs_instance_storage_config    = var.pvs_instance_storage_config

}

module "instance-sap-init-sles" {
  source                         = "./power-sap-instance-init-sles"
  depends_on                     = [module.instance-sap]

  bastion_public_ip              = var.bastion_public_ip
  host_private_ip                = module.instance-sap.instance_mgmt_ip
  ssh_private_key                = var.ssh_private_key
  vpc_address_prefix             = var.vpc_address_prefix
  pvs_bastion_snat_config        = { 
                                     required               = var.proxy_config == "SNAT" ? true : false
                                     pvs_bastion_private_ip = var.bastion_private_ip
                                   }
  vpc_bastion_proxy_config       = {
                                     required               = var.proxy_config == "SQUID" ? true : false 
                                     vpc_bastion_private_ip = var.bastion_private_ip
                                     no_proxy_ips           = module.instance-sap.instance_private_ips
                                   }
  suse_activation                = var.suse_activation                                
  pvs_instance_storage_config    = merge(var.pvs_instance_storage_config,{"wwns" = join(",", module.instance-sap.instance_wwns)})
  sap_solution                   = var.sap_solution
}
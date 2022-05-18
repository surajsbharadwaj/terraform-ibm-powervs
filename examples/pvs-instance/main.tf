#####################################################
# PVS Instance Deployment example
# Copyright 2022 IBM
#####################################################

provider "ibm" {
  region    =   var.pvs_region
  zone      =   var.pvs_zone
  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}

module "import-image" {
  //source = "terraform-ibm-modules/powervs/ibm//modules/image-import"
  source  = "../../modules/image-import"
  
  pvs_zone                       = var.pvs_zone
  pvs_resource_group_name        = var.pvs_resource_group_name
  pvs_service_name               = var.pvs_service_name
  pvs_image_name                 = var.pvs_instance_image_name
}

module "instance-sap" {
  // source = "terraform-ibm-modules/powervs/ibm//modules/pvs-instance"
  source = "../../modules/pvs-instance"
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
  pvs_instance_storage_config    = var.pvs_instance_storage_config
}
#####################################################
# VPC Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
  region    =   var.pvs_region
  zone      =   var.pvs_zone
}

module "pvs" {
  // source = "terraform-ibm-modules/powervs/ibm//modules/pvs"
  source = "../../modules/powervs_service"
  
  pvs_zone                  = var.pvs_zone
  pvs_resource_group_name   = var.pvs_resource_group_name
  pvs_service_name          = var.pvs_service_name
  pvs_tags                  = var.pvs_tags
  pvs_sshkey_name           = var.pvs_sshkey_name
  pvs_public_key            = var.pvs_public_key
  pvs_image_names           = var.pvs_image_names
  pvs_public_network_name   = var.pvs_public_network_name
  pvs_management_network    = var.pvs_management_network
  pvs_sap_network           = var.pvs_sap_network
  pvs_backup_network        = var.pvs_backup_network
}
#####################################################
# PVS Configuration
# Copyright 2022 IBM
#####################################################

module "sap-service" {
  source = "./power-sap-service"
  
  pvs_zone                  = var.pvs_zone
  pvs_resource_group_name   = var.pvs_resource_group_name
  pvs_service_name          = var.pvs_service_name
  pvs_tags                  = var.pvs_tags
  pvs_sshkey_name           = var.pvs_sshkey_name
  pvs_public_key            = var.pvs_public_key
  pvs_image_names           = var.pvs_image_names
  pvs_public_network_name   = var.pvs_public_network_name
  pvs_management_network    = var.pvs_management_network
  pvs_backup_network        = var.pvs_backup_network
}

provider "ibm" {
  alias            = "dlcvpc"
  region           = var.vpc_region
  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}

data "ibm_is_vpc" "vpc_crn_ds" {
  count    = length(var.vpc_names) >= 1 ? length(var.vpc_names) : 0
  provider = ibm.dlcvpc 
  name     = var.vpc_names[count.index]
}

module "cloud-connection" {
  source  = "./power-sap-vpc-pvs-cloudconnection"
  depends_on                  = [module.sap-service]
  
  pvs_zone                    = var.pvs_zone   
  pvs_resource_group_name     = var.pvs_resource_group_name
  pvs_service_name            = var.pvs_service_name
  cloud_connection_reuse      = var.cloud_connection_reuse
  cloud_connection_name       = var.cloud_connection_name
  cloud_connection_count      = var.cloud_connection_count
  cloud_connection_speed      = var.cloud_connection_speed
  pvs_subnet_names            = [var.pvs_management_network.name,var.pvs_backup_network.name]
  ibmcloud_api_key            = var.ibmcloud_api_key
  vpc_region                  = var.vpc_region
  vpc_crns                    = length(var.vpc_names) >= 1 ? data.ibm_is_vpc.vpc_crn_ds.*.crn : null
  cloud_connection_gr         = var.cloud_connection_gr
  cloud_connection_metered    = var.cloud_connection_metered
  
}
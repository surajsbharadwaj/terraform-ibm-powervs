#####################################################
# PowerVS Cloud connection create
# Copyright 2022 IBM
#####################################################

provider "ibm" {
  region           = var.pvs_region
  zone             = var.pvs_zone
  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}


module "cloud-connection-create" {
  //source = "terraform-ibm-modules/powervs/ibm//modules/cloud-connection-create"
  source  = "../../modules/cloud-connection"
  
  pvs_zone                    = var.pvs_zone   
  pvs_resource_group_name     = var.pvs_resource_group_name
  pvs_service_name            = var.pvs_service_name
  cloud_connection_reuse      = var.cloud_connection_reuse
  cloud_connection_name       = var.cloud_connection_name
  cloud_connection_count      = var.cloud_connection_count
  cloud_connection_speed      = var.cloud_connection_speed
  pvs_subnet_names            = var.pvs_subnet_names
  cloud_connection_vpc_enable = var.cloud_connection_vpc_enable
  ibmcloud_api_key            = var.ibmcloud_api_key
  vpc_region                  = var.vpc_region
  vpc_names                   = var.vpc_names
  cloud_connection_gr         = var.cloud_connection_gr
  cloud_connection_metered    = var.cloud_connection_metered
  
}
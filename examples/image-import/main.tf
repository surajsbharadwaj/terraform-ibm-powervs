#####################################################
# PowerVS Image Import
# Copyright 2022 IBM
#####################################################

provider "ibm" {
  region    =   "sao"
  zone      =   "sao01"
}

module "import_image" {
  //source = "terraform-ibm-modules/powervs/ibm//modules/image-import"
  source  = "../../modules/image-import"
  
  pvs_zone                  = var.pvs_zone
  pvs_resource_group_name   = var.pvs_resource_group_name
  pvs_service_name          = var.pvs_service_name
  pvs_image_name            = var.pvs_image_name
}
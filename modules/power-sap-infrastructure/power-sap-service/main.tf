#####################################################
# PowerVs Resource Configuration
# Copyright 2022 IBM
#####################################################

locals {
  service_type = "power-iaas"
  plan         = "power-virtual-server-group"
}

data "ibm_resource_group" "resource_group_ds" {
  name = var.pvs_resource_group_name
}

resource "ibm_resource_instance" "pvs_service" {
  name              = var.pvs_service_name
  service           = local.service_type
  plan              = local.plan
  location          = var.pvs_zone
  resource_group_id = data.ibm_resource_group.resource_group_ds.id
  tags              = (var.pvs_tags != null ? var.pvs_tags : [])

  timeouts {
    create = "6m"
    update = "5m"
    delete = "10m"
  }
}

#####################################################
# Create PowerVs SSH Key
# Copyright 2022 IBM
#####################################################

resource "ibm_pi_key" "ssh_key" {
  pi_cloud_instance_id = ibm_resource_instance.pvs_service.guid
  pi_key_name          = var.pvs_sshkey_name
  pi_ssh_key           = var.pvs_public_key
}

#####################################################
# Import Catalog Images
# Copyright 2022 IBM
#####################################################

data "ibm_pi_catalog_images" "catalog_images_ds" {
  sap                  = true
  pi_cloud_instance_id = ibm_resource_instance.pvs_service.guid
}

locals {
  catalog_images_to_import = flatten([for stock_image in data.ibm_pi_catalog_images.catalog_images_ds.images : [for image_name in var.pvs_image_names : stock_image if stock_image.name == image_name]])
}

resource "ibm_pi_image" "import_images" {
  count                = length(var.pvs_image_names)
  pi_cloud_instance_id = ibm_resource_instance.pvs_service.guid
  pi_image_id          = local.catalog_images_to_import[count.index].image_id
  pi_image_name        = var.pvs_image_names[count.index]
}

#####################################################
# Create Public and Private Subnets
# Copyright 2022 IBM
#####################################################

resource "ibm_pi_network" "public_network" {
  pi_cloud_instance_id = ibm_resource_instance.pvs_service.guid
  pi_network_name      = var.pvs_public_network_name
  pi_dns               = ["9.9.9.9"]
  pi_network_type      = "pub-vlan"
}

resource "ibm_pi_network" "management_network" {
  depends_on           = [ibm_pi_network.public_network]
  pi_cloud_instance_id = ibm_resource_instance.pvs_service.guid
  pi_network_name      = var.pvs_management_network["name"]
  pi_cidr              = var.pvs_management_network["cidr"]
  pi_dns               = ["127.0.0.1"]
  pi_network_type      = "vlan"
  pi_network_jumbo     = true
}

resource "ibm_pi_network" "backup_network" {
  depends_on           = [ibm_pi_network.management_network]
  pi_cloud_instance_id = ibm_resource_instance.pvs_service.guid
  pi_network_name      = var.pvs_backup_network["name"]
  pi_cidr              = var.pvs_backup_network["cidr"]
  pi_dns               = ["127.0.0.1"]
  pi_network_type      = "vlan"
  pi_network_jumbo     = true
}
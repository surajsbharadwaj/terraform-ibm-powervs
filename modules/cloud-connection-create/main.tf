#####################################################
# PowerVs cloud connection create Configuration
# Copyright 2022 IBM
#####################################################

locals {
  service_type          = "power-iaas"
}

data "ibm_resource_group" "resource_group_ds" {
  name = var.pvs_resource_group_name
}

data "ibm_resource_instance" "pvs_service_ds" {
  name                 = var.pvs_service_name
  service              = local.service_type
  location             = var.pvs_zone
  resource_group_id    = data.ibm_resource_group.resource_group_ds.id
}

#####################################################
# Get VPC CRN
# Copyright 2022 IBM
#####################################################

provider "ibm" {
  alias            = "dlcvpc"
  region           = var.vpc_region
  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}

data "ibm_is_vpc" "vpc_crn_ds" {
  count    = var.cloud_connection_vpc_enable ? 1 : 0
  provider = ibm.dlcvpc 
  name     = var.vpc_name
}

#####################################################
# Get PowerVS subnet IDs
# Copyright 2022 IBM
#####################################################

data "ibm_pi_network" "pvs_subnets_ds" {
  count                = length(var.pvs_subnet_names)
  pi_cloud_instance_id = data.ibm_resource_instance.pvs_service_ds.guid
  pi_network_name      = var.pvs_subnet_names[count.index]
}

#####################################################
# Create Cloud Connection 1
# Copyright 2022 IBM
#####################################################

resource "ibm_pi_cloud_connection" "cloud_connection" {
  pi_cloud_instance_id                = data.ibm_resource_instance.pvs_service_ds.guid
  pi_cloud_connection_name            = var.cloud_connection_name
  pi_cloud_connection_speed           = var.cloud_connection_speed
  pi_cloud_connection_global_routing  = var.cloud_connection_gr
  pi_cloud_connection_metered         = var.cloud_connection_metered
  pi_cloud_connection_networks        = toset(data.ibm_pi_network.pvs_subnets_ds.*.id)
  pi_cloud_connection_vpc_enabled     = var.cloud_connection_vpc_enable ? var.cloud_connection_vpc_enable : null 
  pi_cloud_connection_vpc_crns        = var.cloud_connection_vpc_enable ? toset([data.ibm_is_vpc.vpc_crn_ds.0.crn]) : null
}

#####################################################
# Create Cloud Connection 2
# Copyright 2022 IBM
#####################################################

resource "ibm_pi_cloud_connection" "cloud_connection_backup" {
  depends_on                          = [ibm_pi_cloud_connection.cloud_connection]
  count                               = var.cloud_connection_count > 1 ? 1 : 0
  pi_cloud_instance_id                = data.ibm_resource_instance.pvs_service_ds.guid
  pi_cloud_connection_name            = "${var.cloud_connection_name}-bkp"
  pi_cloud_connection_speed           = var.cloud_connection_speed
  pi_cloud_connection_global_routing  = var.cloud_connection_gr
  pi_cloud_connection_metered         = var.cloud_connection_metered
  pi_cloud_connection_networks        = toset(data.ibm_pi_network.pvs_subnets_ds.*.id)
  pi_cloud_connection_vpc_enabled     = var.cloud_connection_vpc_enable ? var.cloud_connection_vpc_enable : null 
  pi_cloud_connection_vpc_crns        = toset([data.ibm_is_vpc.vpc_crn_ds.0.crn])
}
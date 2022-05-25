#####################################################
# Powervs service module Example
# Copyright 2022 IBM
#####################################################


/****************************************************
Example Usage:

ibmcloud_api_key        = "_3asd"
pvs_region              = "sao"
pvs_zone                = "sao01"
pvs_resource_group_name = "Default"
pvs_service_name        = "TestService"
pvs_sshkey_name         = "publish"
pvs_public_key          = "ssh-rsa AAAAB3Nz......"
pvs_image_names         = ["Linux-SUSE-SAP-12-4","Linux-RHEL-SAP-8-1"]
pvs_public_network_name = "public_net"
pvs_management_network  = {
  name = "mgmt_net"
  cidr = "10.97.0.1/24"
}
pvs_backup_network      = {
  name = "bkp_net"
  cidr = "10.99.0.1/24"
}
pvs_tags     = ["T1","T2"]
******************************************************/
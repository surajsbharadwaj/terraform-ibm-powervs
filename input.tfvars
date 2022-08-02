#####################################################
# Powervs Infrastructure SAP module Example
# Copyright 2022 IBM
#####################################################

/****************************************************
Example 1 usage with new cloud connection:

worksapce_id            = "us-east.workspace.Demo.cee9aead"  # optional
ibmcloud_api_key        = "3_asd"
prefix                  = "work"
pvs_zone                = "syd04"
pvs_resource_group_name = "Automation" # existing resource group name
ssh_public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABg"

pvs_management_network  = {
  name = "mgmt_net"
  cidr = "10.61.0.0/24"
}
pvs_backup_network      = {
  name = "bkp_net"
  cidr = "10.62.0.0/24"
}
tags                        = ["T1","T2"]

cloud_connection_count      = "2" ### 1 or 2 depending on availability in DC. Per DC max count is 2
cloud_connection_speed      = "5000"  ### mandatory
transit_gw_name             = "syd-tg" ## required when creating new cloud connection
cloud_connection_gr         = true # optional
cloud_connection_metered    = false # optional


******************************************************/

/****************************************************
Example 2 usage reusing cloud connection:

worksapce_id            = ""  # optional
ibmcloud_api_key        = "3_asd"
prefix                  = "work"
pvs_zone                = "syd04"
pvs_resource_group_name = "Automation" # existing resource group name
ssh_public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQGG8L"

pvs_management_network  = {
  name = "mgmt_net"
  cidr = "10.61.0.0/24"
}
pvs_backup_network      = {
  name = "bkp_net"
  cidr = "10.62.0.0/24"
}
tags                        = ["T1","T2"]

cloud_connection_count      = "2" ### 1 or 2 depending on availability in DC. Per DC max count is 2
transit_gw_name             = "" ## blank when reusing cloud connection

******************************************************/

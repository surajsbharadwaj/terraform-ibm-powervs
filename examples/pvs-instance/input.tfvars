#####################################################
# Powervs instance module Example
# Copyright 2022 IBM
#####################################################


/****************************************************
Example Usage 1 specifying Profile ID:

ibmcloud_api_key               = "_3R"
pvs_region                     = "sao"
pvs_zone                       = "sao01"
pvs_resource_group_name        = "Default"
pvs_service_name               = "TestService"
pvs_instance_hostname          = "hana"
pvs_sshkey_name                = "publish"
pvs_instance_image_name        = "Linux-SUSE-SAP-12-4"
pvs_instance_profile_id        = "ush1-4x128"
pvs_instance_storage_config    = { 
                                   names  = "data,log,shared,usrsap"
                                   disks_size = "160,150,300,50"
                                   counts = "8,8,1,1"
                                   tiers  = "tier1,tier1,tier3,tier3"
                                   paths  = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                                  }
pvs_instance_private_net_names = [ "mgmt_net","sap_net","bkp_net"]

******************************************************/

/****************************************************
Example Usage 2 specifying cores, Mem, Systype, proc type:

ibmcloud_api_key               = "_3R"
pvs_region                     = "sao"
pvs_zone                       = "sao01"
pvs_resource_group_name        = "Default"
pvs_service_name               = "TestService"
pvs_instance_hostname          = "hana"
pvs_sshkey_name                = "publish"
pvs_instance_image_name        = "Linux-SUSE-SAP-12-4"
pvs_instance_sys_type          = "s922"
pvs_instance_proc_type         = "dedicated"
pvs_instance_processors        = "2"
pvs_instance_memory            = "200"
pvs_instance_storage_config    = { 
                                   names  = "data,log,shared,usrsap"
                                   disks_size = "160,150,300,50"
                                   counts = "8,8,1,1"
                                   tiers  = "tier1,tier1,tier3,tier3"
                                   paths  = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                                  }
pvs_instance_private_net_names = [ "mgmt_net","sap_net","bkp_net"]

******************************************************/

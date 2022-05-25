#####################################################
# Powervs instance module Example For HANA
# Copyright 2022 IBM
#####################################################


/****************************************************
Example Usage 1 using SQUID:

ibmcloud_api_key               = "_3R"
pvs_region                     = "sao"
pvs_zone                       = "sao01"
pvs_resource_group_name        = "Default"
pvs_service_name               = "TestService"
pvs_instance_hostname          = "hana"
pvs_sshkey_name                = "publish"
pvs_instance_image_name        = "Linux-SUSE-SAP-12-4"
pvs_instance_profile_id        = "ush1-4x128"
pvs_instance_private_net_names = [ "mgmt_net","sap_net","bkp_net"]
pvs_instance_storage_config    = { 
                                   names      = "data,log,shared,usrsap"
                                   disks_size =  "180,200,300,50"
                                   counts     = "8,8,1,1"
                                   tiers      = "tier1,tier1,tier3,tier3"
                                   paths      = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                                  }

proxy_config                   = "SQUID"
bastion_public_ip              = "13.116.82.65"
bastion_private_ip             = "172.20.0.4"
vpc_addressprefix              = "172.20.0.0/23"
suse_activation                = {
                                  required         = true
                                  activation_email = "<email>"
                                  activation_code  = "<activation code>"
                                 }
SSH_PRIVATE_KEY                = <<-EOF
-----BEGIN OPENSSH PRIVATE KEY-----
b3Blsadsadsi5fjoepepe
-----END OPENSSH PRIVATE KEY-----
EOF

******************************************************/

/****************************************************
Example Usage 2 using SNAT:

ibmcloud_api_key               = "_3R"
pvs_region                     = "sao"
pvs_zone                       = "sao01"
pvs_resource_group_name        = "Default"
pvs_service_name               = "TestService"
pvs_instance_hostname          = "hana"
pvs_sshkey_name                = "publish"
pvs_instance_image_name        = "Linux-SUSE-SAP-12-4"
pvs_instance_profile_id        = "ush1-4x128"
pvs_instance_private_net_names = [ "mgmt_net","sap_net","bkp_net"]
pvs_instance_storage_config    = { 
                                   names      = "data,log,shared,usrsap"
                                   disks_size = "160,150,300,50"
                                   counts     = "8,8,1,1"
                                   tiers      = "tier1,tier1,tier3,tier3"
                                   paths      = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                                  }
								  
proxy_config                   = "SNAT"
bastion_public_ip              = "52.99.102.56"
bastion_private_ip             = "10.10.45.2"
vpc_addressprefix              = "" ##optional
suse_activation                = {
                                  required         = true
                                  activation_email = "<email>"
                                  activation_code  = "<activation code>"
                                 }
SSH_PRIVATE_KEY                = <<-EOF
-----BEGIN OPENSSH PRIVATE KEY-----
b3Blsadsadsi5fjoepepe
-----END OPENSSH PRIVATE KEY-----
EOF


******************************************************/

#####################################################
# Powervs instance module Example For Netweaver
# Copyright 2022 IBM
#####################################################


/****************************************************
Example Usage 1 using SQUID:

ibmcloud_api_key               = "_3R"
pvs_region                     = "sao"
pvs_zone                       = "sao01"
pvs_resource_group_name        = "Default"
pvs_service_name               = "TestService"
pvs_instance_hostname          = "nw"
pvs_sshkey_name                = "publish"
pvs_instance_image_name        = "Linux-SUSE-SAP-12-4"
pvs_instance_sys_type          = "s922"
pvs_instance_proc_type         = "dedicated"
pvs_instance_processors        = "4"
pvs_instance_memory            = "200"
pvs_instance_private_net_names = [ "mgmt_net","sap_net","bkp_net"]
pvs_instance_storage_config    = { 
                                   names      = "usrsap,usrtrans"
                                   disks_size = "50,60"
                                   counts     = "1,1"
								   tiers      = "tier3,tier3"
                                   paths      = "/usr/sap,/usr/sap/trans"
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
pvs_instance_hostname          = "nw"
pvs_sshkey_name                = "publish"
pvs_instance_image_name        = "Linux-SUSE-SAP-12-4"
pvs_instance_sys_type          = "s922"
pvs_instance_proc_type         = "dedicated"
pvs_instance_processors        = "4"
pvs_instance_memory            = "200"
pvs_instance_private_net_names = [ "mgmt_net","sap_net","bkp_net"]
pvs_instance_storage_config    = { 
                                   names  = "usrsap,usrtrans"
                                   disks_size = "50,60"
                                   counts = "1,1"
								   tiers  = "tier3,tier3"
                                   paths  = "/usr/sap,/usr/sap/trans"
                                  }
          
proxy_config                   = "SNAT"
bastion_public_ip              = "52.99.102.56"
bastion_private_ip             = "10.10.45.2"
vpc_addressprefix              = ""
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

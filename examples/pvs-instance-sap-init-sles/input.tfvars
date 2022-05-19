#####################################################
# Powervs instance Initialtion For SLES Example
# Copyright 2022 IBM
#####################################################


/****************************************************
Example 1 usage using SNAT:


vpc_address_prefix           = "172.16.0.0/23"
bastion_public_ip            = "163.109.95.206"
host_private_ip              = "10.97.0.59"  ##instance managment private IP
suse_activation              = {
                                  required         = true
                                  activation_email = "<email>"
                                  activation_code  = "<activation code>"
                               }
pvs_bastion_snat_config      = {
                                  required = true
                                  pvs_bastion_private_ip = "10.97.0.45"
                               }                                
pvs_instance_storage_config  = { 
                                  names      = "data,log,shared,usrsap"
                                  paths      = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                                  disks_size = "160,150,300,50"
                                  counts     = "2,2,1,1"
                                  wwns       = "6005076810810261F8000000000045FF,6005076810810261F8000000000045FD,6005076810810261F8000000000045FE,6005076810810261F8000000000045FB,6005076810810261F8000000000045FC,"                                    
                               }
sap_solution                 = "HANA"
ssh_private_key             = <<-EOF
-----BEGIN OPENSSH PRIVATE KEY-----
bEFQVE9QLVFOsadasfvxvsadsadsdsd
VUJBAUGasdasdaasdasdasdasdasdasd
-----END OPENSSH PRIVATE KEY-----
EOF


******************************************************/

/****************************************************
Example 2 usage using SQUID:

vpc_address_prefix           = "172.16.0.0/23"
bastion_public_ip            = "163.109.95.206"
host_private_ip              = "10.97.0.59"  ##instance managment private IP
sap_solution                 = "HANA"
suse_activation              = {
                                  required         = true
                                  activation_email = "<email>"
                                  activation_code  = "<activation code>"
                               }
vpc_bastion_proxy_config     = {
                                  required               = true
                                  vpc_bastion_private_ip = "172.16.0.4"
                                  no_prox_ips            = ""
                               }
pvs_instance_storage_config  = { 
                                  names      = "data,log,shared,usrsap"
                                  paths      = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                                  disks_size = "160,150,300,50"
                                  counts     = "2,2,1,1"
                                  wwns       = "6005076810810261F8000000000045FF,6005076810810261F8000000000045FD,6005076810810261F8000000000045FE,6005076810810261F8000000000045FB,6005076810810261F8000000000045FC,"                                    
                               }
ssh_private_key             = <<-EOF
-----BEGIN OPENSSH PRIVATE KEY-----
bEFQVE9QLVFOsadasfvxvsadsadsdsd
VUJBAUGasdasdaasdasdasdasdasdasd
-----END OPENSSH PRIVATE KEY-----
EOF


******************************************************/
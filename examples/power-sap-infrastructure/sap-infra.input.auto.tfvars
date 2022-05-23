ibmcloud_api_key        = "_3R8jIWMpjyTZW-GPhGR-wFDposIdhYBtmN0QJCgD5YA"
pvs_region              = "sao"
pvs_zone                = "sao01"
pvs_resource_group_name = "Default"
pvs_service_name        = "Infra"
pvs_sshkey_name         = "publish2"
pvs_public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZdQYXrRuCOES9/7DhBZ5BHG5/y6/x8algnv8vbg07pM7r+DtIQ6ZekVFuDzsq+76TurwQRW1hypRqjtPzUYeJMRPJUILHWl6CwXo6ihxUzmBBmdxp1bIrJ8Zpgp9e7W+F2iQrLq5VsUD61+lJYj/zIL939ycGn/+yLoJ721vcj5fguhnBoiuk493us2ltJ+BCkU0LArLDPg1+YIRnfqic8FTBrSq+3qT4JOAMbWUlxbCAn1UzQ7Je8gJYEPwle+ONKdhcgNBxHQUaLQQAmCxjzqZ/nU54Inow+gpeNUktYTYUQvZ5Zo8oMhxPsLff+gOt8Ibv09WgJaUFGy7YS2DaMcr2HvOKwOylYviokmS8K/mJ85hrW4Ifl+CZvNLvIIZct8G9TNNyYL7sZpb39uGpewGz1psEAynA/Kka2O9rvoJ0PvRSIwgHLQ2kM/83N+vLq18gqBfvxyRETPT+DV5Rk+v5Q1TvfiNxJ4+V9lTp/lGwHVEExk3BrFHDaCD9pos= AzureAD+SurajSanathKumarBhar@LAPTOP-QNUBGG8L"
pvs_image_names         = ["Linux-SUSE-SAP-12-4","Linux-RHEL-SAP-8-1"]
pvs_public_network_name = "public_net"
pvs_management_network  = {
  name = "mgmt_net"
  cidr = "10.50.0.1/24"
}
pvs_sap_network         = {
  name = "sap_net"
  cidr = "10.51.0.1/24"
}
pvs_backup_network      = {
  name = "bkp_net"
  cidr = "10.52.0.1/24"
}
pvs_tags     = ["T1","T2"]
cloud_connection_reuse      = true
cloud_connection_count      = "1"
cloud_connection_name       = "test2-auto"
cloud_connection_speed      = "5000"
pvs_subnet_names            = ["mgmt_net","sap_net","bkp_net"]
cloud_connection_vpc_enable = true
vpc_region                  = "br-sao"
vpc_names                   = ["v2sao01-vpc-for-pvs"]
cloud_connection_gr         = true
cloud_connection_metered    = false
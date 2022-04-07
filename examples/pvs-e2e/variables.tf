variable "pvs_region" {
  description = "IBM Cloud Region"
  type        = string
  default     = "sao"
}

variable "pvs_zone" {
  description = "IBM Cloud Zone"
  type        = string
  default     = "sao01"
}

variable "pvs_resource_group_name" {
  description = "Exisiting Resource Group Name"
  type        = string
  default     = "Default"
}

variable "pvs_service_name" {
  description = "Name of PowerVS service which will be created"
  type        = string
  default     = "TestService"
}

variable "pvs_sshkey_name" {
  description = "Name of PowerVS SSH Key which will be created"
  type        = string
  default     = "testkey"
}

variable "pvs_public_key" {
  description = "PowerVS SSH Public key data"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZdQYXrRuCOES9/7DhBZ5BHG5/y6/x8algnv8vbg07pM7r+DtIQ6ZekVFuDzsq+76TurwQRW1hypRqjtPzUYeJMRPJUILHWl6CwXo6ihxUzmBBmdxp1bIrJ8Zpgp9e7W+F2iQrLq5VsUD61+lJYj/zIL939ycGn/+yLoJ721vcj5fguhnBoiuk493us2ltJ+BCkU0LArLDPg1+YIRnfqic8FTBrSq+3qT4JOAMbWUlxbCAn1UzQ7Je8gJYEPwle+ONKdhcgNBxHQUaLQQAmCxjzqZ/nU54Inow+gpeNUktYTYUQvZ5Zo8oMhxPsLff+gOt8Ibv09WgJaUFGy7YS2DaMcr2HvOKwOylYviokmS8K/mJ85hrW4Ifl+CZvNLvIIZct8G9TNNyYL7sZpb39uGpewGz1psEAynA/Kka2O9rvoJ0PvRSIwgHLQ2kM/83N+vLq18gqBfvxyRETPT+DV5Rk+v5Q1TvfiNxJ4+V9lTp/lGwHVEExk3BrFHDaCD9pos= AzureAD+SurajSanathKumarBhar@LAPTOP-QNUBGG8L"
}

variable "pvs_image_names" {
  description = "List of Images to be imported into cloud account from catalog images"
  type        = list(string)
  default     = ["Linux-SUSE-SAP-12-4","Linux-RHEL-SAP-8-1"]
}

variable "pvs_public_network_name" {
  description = "Name of PowerVS Public Network which will be created"
  type        = string
  default     = "public_net"
}

variable "pvs_management_network" {
  description = "PowerVS Management Subnet name and cidr which will be created."
  type        = map
  deafult     = {
                  name = "mgmt_net"
                  cidr = "10.97.0.1/24"
                }
}

variable "pvs_sap_network" {
  description = "PowerVS SAP Subnet name and cidr which will be created."
  type        = map
  deafult     = {
                  name = "sap_net"
                  cidr = "10.98.0.1/24"
                }
}

variable "pvs_backup_network" {
  description = "PowerVS Backup Network name and cidr which will be created."
  type        = map
  deafult     = {
                  name = "backup_net"
                  cidr = "10.99.0.1/24"
                }
}

variable "pvs_tags" {
  description = "List of Tag names for PowerVS service"
  type        = list(string)
  default     = ["T1","T2"]
}
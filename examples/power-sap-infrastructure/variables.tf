variable "pvs_region" {
  description = "IBM Cloud Region"
  type        = string
}

variable "pvs_zone" {
  description = "IBM Cloud Zone"
  type        = string
}

variable "pvs_resource_group_name" {
  description = "Existing Resource Group Name"
  type        = string
}

variable "pvs_service_name" {
  description = "Name of PowerVS service which will be created"
  type        = string
}

variable "pvs_sshkey_name" {
  description = "Name of PowerVS SSH Key which will be created"
  type        = string
}

variable "pvs_public_key" {
  description = "PowerVS SSH Public key data"
  type        = string
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
}

variable "pvs_sap_network" {
  description = "PowerVS SAP Subnet name and cidr which will be created."
  type        = map
}

variable "pvs_backup_network" {
  description = "PowerVS Backup Network name and cidr which will be created."
  type        = map
}

variable "cloud_connection_reuse" {
  description = "Use existing Cloud connection to attach PVS subnets"
  type        = bool
}

variable "cloud_connection_name" {
  description = "Name of the Cloud connection which will be created"
  type        = string
}

variable "cloud_connection_count" {
  description = "Required number of Cloud connections"
  type        = string
  default     = 2
}

variable "cloud_connection_speed" {
  description = "Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000"
  type        = string
  default     = null
}

variable "cloud_connection_vpc_enable" {
  description = "Enable VPC for this cloud connection"
  type        = bool
  default     = false
}

variable "vpc_region" {
  description = "IBM Cloud VPC Region. Required if cloud_connection_vpc_enable is true"
  type        = string
  default     = null
}

variable "vpc_names" {
  description = "Existing VPC Names which has to be attached to Cloud connection. Required if cloud_connection_vpc_enable is true"
  type        = list
  default     = null
}

variable "cloud_connection_gr" {
  description = "Enable global routing for this cloud connection"
  type        = bool
  default     = null
}

variable "cloud_connection_metered" {
  description = "Enable metered for this cloud connection"
  type        = bool
  default     = null
}

#####################################################
# Optional Parameters
#####################################################

variable "pvs_tags" {
  description = "List of Tag names for PowerVS service"
  type        = list(string)
  default     = null
}

variable "ibmcloud_api_key" {
  description = "IBM Cloud Api Key"
  type        = string
  default     = null
}
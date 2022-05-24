variable "pvs_zone" {
  description = "IBM Cloud Zone"
  type        = string
}

variable "pvs_resource_group_name" {
  description = "Existing Resource Group Name"
  type        = string
}

variable "pvs_service_name" {
  description = "Existing PowerVS Service Name"
  type        = string
}

variable "cloud_connection_reuse" {
  description = "Use existing Cloud connection to attach PVS subnets"
  type        = bool
}

variable "cloud_connection_name" {
  description = "Name of the Cloud connection which will be created/ Existing name of cloud connection to attach subnets"
  type        = string
}

variable "cloud_connection_count" {
  description = "Required number of Cloud connections. Ignore when Reusing. Maximum is 2 per location"
  type        = string
  default     = 2
}

variable "cloud_connection_speed" {
  description = "Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000. Required when creating new connection"
  type        = string
  default     = null
}

variable "pvs_subnet_names" {
  description = "List of PowerVs subnet names to be attached to Cloud connection"
  type        = list
}

variable "vpc_region" {
  description = "IBM Cloud VPC Region. Required if cloud_connection_vpc_enable is true"
  type        = string
  default     = null
}

variable "cloud_connection_vpc_enable" {
  description = "Enable VPC for this cloud connection. Required when creating new connection"
  type        = bool
  default     = false
}

variable "vpc_crns" {
  description = "Existing VPC Crns which has to be attached to Cloud connection. Required if cloud_connection_vpc_enable is true"
  type        = list
  default     = null
}

variable "cloud_connection_gr" {
  description = "Enable global routing for this cloud connection.Can be specified when creating new connection"
  type        = bool
  default     = null
}

variable "cloud_connection_metered" {
  description = "Enable metered for this cloud connection. Can be specified when creating new connection"
  type        = bool
  default     = null
}

variable "ibmcloud_api_key" {
  description = "IBM Cloud Api Key"
  type        = string
  default     = null
}

variable "ibmcloud_api_key" {
  description = "IBM cloud Api Key"
  type        = string
  default     = null
}
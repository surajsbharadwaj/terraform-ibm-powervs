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
  description = "Existing PowerVS Service Name"
  type        = string
}

variable "cloud_connection_name" {
  description = "Name of the Cloud connection which will be created"
  type        = string
}

variable "cloud_connection_count" {
  description = "Required number of Cloud connections"
  type        = string
}

variable "cloud_connection_speed" {
  description = "Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000"
  type        = string
}

variable "pvs_subnet_names" {
  description = "List of PowerVs subnet names to be attached to Cloud connection"
  type        = list
}
variable "cloud_connection_vpc_enable" {
  description = "Enable VPC for this cloud connection"
  type        = bool
}

variable "vpc_region" {
  description = "IBM Cloud VPC Region. Required if cloud_connection_vpc_enable is true"
  type        = string
  default     = null
}

variable "vpc_name" {
  description = "Existing VPC Name which has to be attached to Cloud connection. Required if cloud_connection_vpc_enable is true"
  type        = string
  default     = null
}

variable "cloud_connection_gr" {
  description = "Enable global routing for this cloud connection"
  type        = bool
}

variable "cloud_connection_metered" {
  description = "Enable metered for this cloud connection"
  type        = bool
}

#####################################################
# Optional Parameters
#####################################################

variable "ibmcloud_api_key" {
  description = "IBM Cloud Api Key"
  type        = string
  default     = null
}
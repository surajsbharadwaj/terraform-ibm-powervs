variable "pvs_zone" {
  description = "IBM Cloud Zone"
  type        = string
}

variable "pvs_resource_group_name" {
  description = "Exisiting Resource Group Name"
  type        = string
}

variable "pvs_service_name" {
  description = "Exisiting PowerVS Service Name"
  type        = string
}

variable "pvs_image_name" {
  description = "Name of image to Import"
  type        = string
}
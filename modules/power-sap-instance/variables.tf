variable "brownfield" {
  description = "Existing Cloud PowerVS Service project"
  type        = bool
}

variable "pvs_zone" {
  description = "IBM Cloud Zone"
  type        = string 
}

variable "pvs_resource_group_name" {
  description = "Existing PowerVS service resource group Name"
  type        = string
}

variable "pvs_service_name" {
  description = "Existing Name of the PowerVS service"
  type        = string
}

variable "pvs_instance_hostname" {
  description = "Name of instance which will be created"
  type        = string
}

variable "pvs_sshkey_name" {
  description = "Existing SSH key name"
  type        = string
}

variable "pvs_instance_image_name" {
  description = "Image Name for node"
  type        = string
  default     = "Linux-SUSE-SAP-12-4"
}

variable "pvs_instance_profile_id" {
  description = "SAP PROFILE ID. If this is mentioned then Memory, processors, proc_type and sys_type will not be taken into account"
  type        = string
  default     = null
}

variable "pvs_instance_sys_type" {
  description = "Processor type e980 or s922"
  type        = string
  default     = null
}

variable "pvs_instance_proc_type" {
  description = "Dedicated or shared processors"
  type        = string
  default     = null
}

variable "pvs_instance_processors" {
  description = "Number of processors"
  type        = string
  default     = null
}

variable "pvs_instance_memory" {
  description = "Amount of memory"
  type        = string
  default     = null
}

variable "pvs_instance_private_net_names" {
  description = "Existing list of subnets name to be attached to node. First network has to be a management network"
  type        = list
}

variable "pvs_instance_private_net_ids" {
  description = "Additional network ids to be attached"
  type        = list 
  default     = null
}

variable "pvs_instance_storage_config" {
  description = "DISKS To be created and attached to node.Comma separated values"
  type        = map
  default     = {
                    names      = ""
                    paths      = ""
                    disks_size = ""
					counts     = ""
                    tiers      = ""
  }
}

#####################################################
# PVS SAP instance Initialization 
# Copyright 2022 IBM
#####################################################

variable "proxy_config" {
  description = "SQUID to use as proxy"
  type        = string
  default     = "SQUID"
}

variable "bastion_public_ip" {
  description = "Public IP of Bastion/jumpserver Host"
  type        = string
}

variable "bastion_private_ip" {
  description = "Private IP of Bastion/jumpserver Host"
  type        = string
}

variable "ssh_private_key" {
  description = "Private Key to configure Instance, Will not be uploaded to server" 
  type        = string
}

variable "os_activation" {
  description = "SUSE/RHEL activation email and code to register OS"
  type        = map
  default     = {
                    required            = false
                    activation_username = ""
                    activation_password = ""
                }
}

variable "sap_solution" {
  description = "To Execute Playbooks for Hana or NetWeaver. Value can be either HANA OR NETWEAVER"
  type        = string
}

variable "sap_domain" {
  description = "Domain name to be set. Required when using RHEL image"
  type        = string
  default     = null
}

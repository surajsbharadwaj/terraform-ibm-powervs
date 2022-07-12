variable "pvs_zone" {
  description = "IBM Cloud PVS Zone. Valid values: sao01,osa21,tor01,us-south,dal12,us-east,tok04,lon04,lon06,eu-de-1, eu-de-2,syd04,syd05"
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

variable "pvs_sshkey_name" {
  description = "Existing SSH key name"
  type        = string
}

variable "pvs_instance_image_name" {
  description = "Image Name for node. Valid values: Linux-RHEL-SAP-8-1, Linux-RHEL-SAP-8-2, Linux-RHEL-SAP-8-4, Linux-SUSE-SAP-12-4, Linux-SUSE-SAP-15-2, Linux-SUSE-SAP-15-3"
  type        = string
  default     = "Linux-SUSE-SAP-15-3"
}

variable "pvs_instance_private_net_names" {
  description = "Existing list of subnets name to be attached to node. First network has to be a management network"
  type        = list
}

variable "pvs_instance_sap_network" {
  description = "New Network for SAP system"
  type        = map
  default     = {
                  "name"     = "sap_net"
				  "cidr"     = "10.111.1.1/24"
				}
}

variable "cloud_connection_name" {
  description = "Existing cloud connection name, to attach the new sap network"
  type        = string
}

variable "pvs_hana_instance_hostname" {
  description = "Name of hana instance which will be created"
  type        = string
}

variable "pvs_hana_instance_profile_id" {
  description = "SAP PROFILE ID for hana instance. If this is mentioned then Memory, processors, proc_type and sys_type will not be taken into account"
  type        = string
  default     = "ush1-4x128"
}

variable "pvs_hana_instance_storage_config" {
  description = "DISKS To be created and attached to hana node.Comma separated values"
  type        = map
  default     = { 
                  names      = "data,log,shared,usrsap"
                  disks_size = "180,200,300,50"
                  counts     = "8,8,1,1"
                  tiers      = "tier1,tier1,tier3,tier3"
                  paths      = "/hana/data,/hana/log,/hana/shared,/usr/sap"
                }
}

variable "pvs_nw_instance_hostname" {
  description = "Name of nw instances which will be created"
  type        = string
  default     = "nw"
}

variable "pvs_nw_instance_count" {
  description = "Number of NetWeaver instances to be created"
  type        = number
  default     = 2
}

variable "pvs_nw_instance_proc_type" {
  description = "Dedicated or shared or uncapped processors"
  type        = string
  default     = "dedicated"
}

variable "pvs_nw_instance_processors" {
  description = "Number of processors"
  type        = string
  default     = "4"
}

variable "pvs_nw_instance_memory" {
  description = "Amount of memory"
  type        = string
  default     = "400"
}

variable "pvs_nw_instance_storage_config" {
  description = "DISKS To be created and attached to nw nodes.Comma separated values"
  type        = map
  default     = { 
                  names      = "usrsap,usrtrans"
                  disks_size = "50,60"
                  counts     = "1,1"
                  tiers      = "tier3,tier3"
                  paths      = "/usr/sap,/usr/sap/trans"
                }
}

#####################################################
# PVS SAP instance Initialization 
# Copyright 2022 IBM
#####################################################

variable "bastion_public_ip" {
  description = "Existing Public IP of Bastion/jumpserver Host. Squid must be running on this host"
  type        = string
}

variable "bastion_private_ip" {
  description = "Existing Private IP of Bastion/jumpserver Host. Squid must be running on this host"
  type        = string
}

variable "ssh_private_key" {
  description = "Private Key to configure Instance, Will not be uploaded to server" 
  type        = string
}

variable "os_activation" {
  description = "SUSE/RHEL activation username and password to register OS"
  type        = map
  default     = {
                    required            = false
                    activation_username = ""
                    activation_password = ""
                }
}

variable "sap_domain" {
  description = "Domain name to be set. Required when deploying RHEL system."
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "ibmcloud_api_key" {
  description = "IBM Cloud Api Key"
  type        = string
  default     = null
}

variable "ibm_pvs_zone_region_map" {
  description = "Map of IBM Power VS zone to the region of PowerVS Infrastructure"
  type        = map
  default     = {    
                  syd04    = "syd"
                  syd05    = "syd" 
                  eu-de-1  = "eu-de"
                  eu-de-2  = "eu-de"
                  lon04    = "lon"
                  lon06    = "lon"
                  tok04    = "tok" 
                  us-east  = "us-east"
                  us-south = "us-south"
                  dal12    = "us-south"
                  tor01    = "tor"
                  osa21    = "osa"
                  sao01    = "sao"
        }
}

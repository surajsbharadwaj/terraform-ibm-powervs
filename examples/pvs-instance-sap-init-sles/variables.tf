variable "internet_config" {
    type        = string
    description = "Internet configuration using SNAT OR SQUID. Value is either SNAT or SQUID"
}

variable "bastion_public_ip" {
    description = "Public IP of Bastion Host"
}

variable "host_private_ip" {
    description = "Private IP of Netweaver/HANA Host reachable from bastion"
}

variable "ssh_private_key" {
    type        = string
    description = "Private Key to configure Instance, Will not be uploaded to server" 
}

variable "vpc_address_prefix" {
    description = "Existing Address prefix of VPC to reach the HANA/NW node from machine on vpc"
}

variable "pvs_bastion_snat_config" {
    type        = map
    description = "SNAT configuration if required on HANA/nw node to reach public internet via the Bastion host on Power"
    default     = {
                    required               = false
                    pvs_bastion_private_ip = ""
                  }
}

variable "vpc_bastion_proxy_config" {
    type        = map
    description = "SQUID configuration if required on HANA/nw node to reach public internet via the Bastion host on VSI running SQUID server"
    default     = {
                    required               = false
                    vpc_bastion_private_ip = ""
                    no_proxy_ips           = ""
                  }
}

variable "suse_activation" {
    type        = map
    description = "Suse activation email and code to register for suse"
    default     = {
                    required         = false
                    activation_email = ""
                    activation_code  = ""
                  }
}

variable "pvs_instance_storage_config" {
  description = "Disks properties to create filesystems"
  type        = map
  default     = {
                    names      = ""
                    paths      = ""
                    disks_size = ""
                    counts     = ""
                    wwns       = ""
  }
}

variable "sap_solution" {
    type        = string
    description = "To Execute Playbooks for Hana or Netweaver. Value can be either HANA OR NETWEAVER"
}
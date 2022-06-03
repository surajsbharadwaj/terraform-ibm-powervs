variable "bastion_public_ip" {
  description = "Public IP of Bastion Host"
  type        = string
}

variable "host_private_ip" {
  description = "Private IP of Netweaver/HANA Host reachable from bastion"
  type        = string
}

variable "ssh_private_key" {
  description = "Private Key to confgure Instance, Will not be uploaded to server" 
  type        = string
}

variable "pvs_bastion_snat_config" {
  description = "SNAT configuration if required on HANA/nw node to reach public internet via the Bastion host on Power Server"
  type        = map
  default     = {
                    required = false
                    pvs_bastion_private_ip = ""
                }
}

variable "vpc_bastion_proxy_config" {
  description = "SQUID configuration if required on HANA/nw node to reach public internet via the Bastion host on VSI running SQUID server"
  type        = map
  default     = {
                    required = false
                    vpc_bastion_private_ip = ""
                    no_proxy_ips           = ""
                }
}

variable "os_activation" {
  description = "Suse activation email and code to register Os"
  type        = map
  default     = {
                    required            = false
                    activation_username = ""
                    activation_password = ""
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
  description = "To Execute Playbooks for Hana or Netweaver. Value can be either HANA OR NETWEAVER"
  type        = string
}
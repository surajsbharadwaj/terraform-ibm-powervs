variable "bastion_public_ip" {
  description = "Public IP of Bastion Host"
  type        = string
}

variable "host_private_ip" {
  description = "Private IP of NetWeaver/HANA Host reachable from bastion"
  type        = string
}

variable "ssh_private_key" {
  description = "Private Key to configure Instance, Will not be uploaded to server" 
  type        = string
}

variable "vpc_bastion_proxy_config" {
  description = "SQUID configuration if required on HANA/NetWeaver node to reach public internet via the Bastion host on VSI running SQUID server"
  type        = map
  default     = {
                    required = false
                    vpc_bastion_private_ip = ""
                    no_proxy_ips           = ""
                }
}

variable "os_activation" {
  description = "RHEL activation email and code to register OS"
  type        = map
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
  description = "To Execute Playbooks for Hana or NetWeaver. Value can be either HANA OR NETWEAVER"
  type        = string
}

variable "sap_domain" {
  description = "Domain name to be set"
  type        = string
}
# Module powervs-sap-instance

This module creates an instance on PowerVS, Creates volumes, attaches volumes and attaches private network

## Example Usage
```
provider "ibm" {
  region           = "sao"
  zone             = "sao01"
  ibmcloud_api_key = "your api key" != null ? "your api key" : null
}

module "instance-sap" {
  source = "terraform-ibm-modules/powervs/ibm/modules/power-sap-instance"
  
  pvs_zone                       = var.pvs_zone
  pvs_resource_group_name        = var.pvs_resource_group_name
  pvs_service_name               = var.pvs_service_name
  pvs_instance_hostname          = var.pvs_instance_hostname
  pvs_sshkey_name                = var.pvs_sshkey_name
  pvs_instance_image_name        = var.pvs_instance_image_name
  pvs_instance_profile_id        = var.pvs_instance_profile_id
  pvs_instance_sys_type          = var.pvs_instance_sys_type
  pvs_instance_proc_type         = var.pvs_instance_proc_type
  pvs_instance_processors        = var.pvs_instance_processors
  pvs_instance_memory            = var.pvs_instance_memory
  pvs_instance_private_net_names = var.pvs_instance_private_net_names
  pvs_instance_private_net_ids   = var.pvs_instance_private_net_ids
  pvs_instance_storage_config    = var.pvs_instance_storage_config
  bastion_public_ip              = var.bastion_public_ip
  bastion_private_ip             = var.bastion_private_ip
  proxy_config                   = var.proxy_config
  ssh_private_key                = var.ssh_private_key
  vpc_address_prefix             = var.vpc_address_prefix
  suse_activation                = var.suse_activation
  sap_solution                   = var.sap_solution
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_zone | IBM Cloud Zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing Name of PowerVS service | string | n/a | yes |
| pvs\_instance\_hostname | Name of instance which will be created | string | n/a | yes |
| pvs\_sshkey\_name | Existing Name of PowerVS SSH Key | string | n/a | yes |
| pvs\_instance\_image\_name | Image Name for node | string | Linux-SUSE-SAP-12-4 | yes |
| pvs\_instance\_profile\_id | SAP PROFILE ID. If this is mentioned then Memory, processors, proc_type and sys_type will not be taken into account | string | null | optional |
| pvs\_instance\_sys\_type | Processor type e980 or s922 | string | null | optional |
| pvs\_instance\_proc\_type | Dedicated or shared processors | string | null | optional |
| pvs\_instance\_processors | Number of processors | string | null | optional |
| pvs\_instance\_memory | Amount of memory | string | null | optional |
| pvs\_instance\_private\_net\_names | Existing list of subnets name to be attached to node. First network has to be a management network  | list | n/a | yes |
| pvs\_instance\_private\_net\_ids | Existing list of additional subnet ids to be attached to node  | list | null | optional |
| pvs\_instance\_storage\_config | DISKS To be created and attached to node.Comma separated values | map | {<br />names = ""<br />paths = ""<br />disks\_size = ""<br />counts = ""<br />tiers  = ""<br />} | yes |
| proxy\_config | Value either SNAT or SQUID for configuring internet for SAP instances | string | n/a | yes |
| bastion\_public\_ip | Public IP of Bastion/Jumpserver Host | string | n/a | yes |
| bastion\_private\_ip | Private IP of Bastion/Jumpserver | string | n/a | yes |
| ssh\_private\_key | Private Key to confgure Instance, Will not be uploaded to server | string | n/a | yes |
| vpc\_address\_prefix | Existing Address prefix of VPC to reach the HANA/NW node from machine on vpc | string | n/a | yes |
| suse\_activation | Suse activation email and code to register for suse | map | {<br />required = false<br />activation\_email = ""<br />activation\_code  = ""<br />} | yes |
| sap\_solution | To Execute Playbooks for Hana or Netweaver. Value can be either HANA OR NETWEAVER | string | n/a | yes |

## Outputs

| Name                              | Description                                           | Type   |
|-----------------------------------|-------------------------------------------------------|--------|
| instance\_private\_ips | Instance Private IPs | string |
| instance\_mgmt\_ip | Instance Management IP | string |
| instance\_wwns | Volumes WWNs of the instance | list |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

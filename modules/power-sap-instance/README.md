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
  
  #### OS Initialization Variables
  
  bastion_public_ip              = var.bastion_public_ip
  bastion_private_ip             = var.bastion_private_ip
  proxy_config                   = var.proxy_config
  ssh_private_key                = var.ssh_private_key
  os_activation                  = var.os_activation
  sap_solution                   = var.sap_solution
  sap_domain                     = var.sap_domain
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_import-image"></a> [import-image](#module\_import-image) | ./power-image-import | n/a |
| <a name="module_instance-sap"></a> [instance-sap](#module\_instance-sap) | ./power-instance | n/a |
| <a name="module_instance-sap-init-sles"></a> [instance-sap-init-sles](#module\_instance-sap-init-sles) | ./power-sap-instance-init-sles | n/a |
| <a name="module_instance-sap-init-rhel"></a> [instance-sap-init-rhel](#module\_instance-sap-init-rhel) | ./power-sap-instance-init-rhel | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_brownfield"></a> [brownfield](#input\_brownfield) | Existing Cloud PowerVS Service project | `bool` | n/a | yes |
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM Cloud Zone | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing PowerVS service resource group Name | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Existing Name of the PowerVS service | `string` | n/a | yes |
| <a name="input_pvs_instance_hostname"></a> [pvs\_instance\_hostname](#input\_pvs\_instance\_hostname) | Name of instance which will be created | `string` | n/a | yes |
| <a name="input_pvs_sshkey_name"></a> [pvs\_sshkey\_name](#input\_pvs\_sshkey\_name) | Existing SSH key name | `string` | n/a | yes |
| <a name="input_pvs_instance_image_name"></a> [pvs\_instance\_image\_name](#input\_pvs\_instance\_image\_name) | Image Name for node | `string` | `"Linux-SUSE-SAP-12-4"` | yes |
| <a name="input_pvs_instance_profile_id"></a> [pvs\_instance\_profile\_id](#input\_pvs\_instance\_profile\_id) | SAP PROFILE ID. If this is mentioned then Memory, processors, proc\_type and sys\_type will not be taken into account | `string` | `null` | optional |
| <a name="input_pvs_instance_sys_type"></a> [pvs\_instance\_sys\_type](#input\_pvs\_instance\_sys\_type) | Processor type e980 or s922 | `string` | `null` | optional |
| <a name="input_pvs_instance_proc_type"></a> [pvs\_instance\_proc\_type](#input\_pvs\_instance\_proc\_type) | Dedicated or shared processors | `string` | `null` | optional |
| <a name="input_pvs_instance_processors"></a> [pvs\_instance\_processors](#input\_pvs\_instance\_processors) | Number of processors | `string` | `null` | optional |
| <a name="input_pvs_instance_memory"></a> [pvs\_instance\_memory](#input\_pvs\_instance\_memory) | Amount of memory | `string` | `null` | optional |
| <a name="input_pvs_instance_private_net_names"></a> [pvs\_instance\_private\_net\_names](#input\_pvs\_instance\_private\_net\_names) | Existing list of subnets name to be attached to node. First network has to be a management network | `list` | n/a | yes |
| <a name="input_pvs_instance_private_net_ids"></a> [pvs\_instance\_private\_net\_ids](#input\_pvs\_instance\_private\_net\_ids) | Additional network ids to be attached | `list` | `null` | optional |
| <a name="input_pvs_instance_storage_config"></a> [pvs\_instance\_storage\_config](#input\_pvs\_instance\_storage\_config) | DISKS To be created and attached to node.Comma separated values | `map` | <pre>{<br>  "counts": "",<br>  "disks_size": "",<br>  "names": "",<br>  "paths": "",<br>  "tiers": ""<br>}</pre> | optional |
| <a name="input_proxy_config"></a> [proxy\_config](#input\_proxy\_config) | Value either SNAT or SQUID to use as proxy | `string` | n/a | yes |
| <a name="input_bastion_public_ip"></a> [bastion\_public\_ip](#input\_bastion\_public\_ip) | Public IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_bastion_private_ip"></a> [bastion\_private\_ip](#input\_bastion\_private\_ip) | Private IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | Private Key to configure Instance, Will not be uploaded to server | `string` | n/a | yes |
| <a name="input_os_activation"></a> [os\_activation](#input\_os\_activation) | SUSE/RHEL activation email and code to register OS | `map` | <pre>{<br>  "activation_password": "",<br>  "activation_username": "",<br>  "required": false<br>}</pre> | optional |
| <a name="input_sap_solution"></a> [sap\_solution](#input\_sap\_solution) | To Execute Playbooks for Hana or NetWeaver. Value can be either HANA OR NETWEAVER | `string` | n/a | yes |
| <a name="input_sap_domain"></a> [sap\_domain](#input\_sap\_domain) | Domain name to be set. Required when using RHEL image | `string` | null | yes |
## Outputs

| Name                              | Description                                           | Type   |
|-----------------------------------|-------------------------------------------------------|--------|
| instance\_private\_ips | Instance Private IPs | string |
| instance\_mgmt\_ip | Instance Management IP | string |
| instance\_wwns | Volumes WWNs of the instance | list |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

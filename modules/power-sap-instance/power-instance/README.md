# Module pvs-sap-instance

This module creates an instance on PowerVS, Creates volumes, attaches volumes and attaches private network

## Example Usage
```
provider "ibm" {
  region           = "sao"
  zone             = "sao01"
  ibmcloud_api_key = "your api key" != null ? "your api key" : null
}

module "import-image" {
  source = "terraform-ibm-modules/powervs/ibm/modules/image-import"
  
  pvs_zone                       = var.pvs_zone
  pvs_resource_group_name        = var.pvs_resource_group_name
  pvs_service_name               = var.pvs_service_name
  pvs_image_name                 = var.pvs_instance_image_name
}

module "instance-sap" {
  source = "terraform-ibm-modules/powervs/ibm/modules/power-sap-instance"
  depends_on                     = [module.import-image]
  
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
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Resources

| Name | Type |
|------|------|
| [ibm_pi_instance.sap_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance) | resource |
| [ibm_pi_volume.create_volume](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_volume) | resource |
| [ibm_pi_volume_attach.instance_volumes_attach](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_volume_attach) | resource |
| [ibm_pi_image.image_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_image) | data source |
| [ibm_pi_instance.instance_ips_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_instance) | data source |
| [ibm_pi_instance_ip.instance_mgmt_ip_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_instance_ip) | data source |
| [ibm_pi_key.key_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_key) | data source |
| [ibm_pi_network.pvs_subnets_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_network) | data source |
| [ibm_resource_group.resource_group_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |
| [ibm_resource_instance.pvs_service_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
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

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_private_ips"></a> [instance\_private\_ips](#output\_instance\_private\_ips) | Instance Private IPs |
| <a name="output_instance_mgmt_ip"></a> [instance\_mgmt\_ip](#output\_instance\_mgmt\_ip) | Instance Management IP |
| <a name="output_instance_wwns"></a> [instance\_wwns](#output\_instance\_wwns) | Volumes WWNs of the instance |


## Outputs

| Name                              | Description                                           | Type   |
|-----------------------------------|-------------------------------------------------------|--------|
| instance\_private\_ips | Instance Private IPs | string |
| instance\_mgmt\_ip | Instance Management IP | string |
| instance\_wwns | Volumes WWNs of the instance | list |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

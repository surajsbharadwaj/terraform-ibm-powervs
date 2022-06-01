<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hana"></a> [hana](#module\_hana) | ../../modules/power-sap-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_private_ip"></a> [bastion\_private\_ip](#input\_bastion\_private\_ip) | Private IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_bastion_public_ip"></a> [bastion\_public\_ip](#input\_bastion\_public\_ip) | Public IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_brownfield"></a> [brownfield](#input\_brownfield) | Existing Cloud PowerVS Service project. Set to true | `bool` | `true` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | IBM Cloud Api Key | `string` | `null` | no |
| <a name="input_proxy_config"></a> [proxy\_config](#input\_proxy\_config) | Value either SNAT or SQUID to use as proxy | `string` | n/a | yes |
| <a name="input_pvs_instance_hostname"></a> [pvs\_instance\_hostname](#input\_pvs\_instance\_hostname) | Name of instance which will be created | `string` | n/a | yes |
| <a name="input_pvs_instance_image_name"></a> [pvs\_instance\_image\_name](#input\_pvs\_instance\_image\_name) | Image Name for node | `string` | `"Linux-SUSE-SAP-12-4"` | no |
| <a name="input_pvs_instance_private_net_names"></a> [pvs\_instance\_private\_net\_names](#input\_pvs\_instance\_private\_net\_names) | Existing list of subnets name to be attached to node. First network has to be a management network | `list` | n/a | yes |
| <a name="input_pvs_instance_profile_id"></a> [pvs\_instance\_profile\_id](#input\_pvs\_instance\_profile\_id) | SAP PROFILE ID. If this is mentioned then Memory, processors, proc\_type and sys\_type will not be taken into account | `string` | `"ush1-4x128"` | no |
| <a name="input_pvs_instance_storage_config"></a> [pvs\_instance\_storage\_config](#input\_pvs\_instance\_storage\_config) | DISKS To be created and attached to node.Comma separated values | `map` | <pre>{<br>  "counts": "8,8,1,1",<br>  "disks_size": "180,200,300,50",<br>  "names": "data,log,shared,usrsap",<br>  "paths": "/hana/data,/hana/log,/hana/shared,/usr/sap",<br>  "tiers": "tier1,tier1,tier3,tier3"<br>}</pre> | no |
| <a name="input_pvs_region"></a> [pvs\_region](#input\_pvs\_region) | IBM Cloud Region | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing PowerVS service resource group Name | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Existing Name of the PowerVS service | `string` | n/a | yes |
| <a name="input_pvs_sshkey_name"></a> [pvs\_sshkey\_name](#input\_pvs\_sshkey\_name) | Existing SSH key name | `string` | n/a | yes |
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM Cloud Zone | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | Private Key to configure Instance, Will not be uploaded to server | `string` | n/a | yes |
| <a name="input_suse_activation"></a> [suse\_activation](#input\_suse\_activation) | Suse activation email and code to register for suse | `map` | <pre>{<br>  "activation_code": "",<br>  "activation_email": "",<br>  "required": false<br>}</pre> | no |
| <a name="input_vpc_address_prefix"></a> [vpc\_address\_prefix](#input\_vpc\_address\_prefix) | Existing Address prefix of VPC to reach the HANA/NW node from machine on vpc | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_BASTION_PUBLIC_IP"></a> [BASTION\_PUBLIC\_IP](#output\_BASTION\_PUBLIC\_IP) | n/a |
| <a name="output_PVS_HANA_IPS"></a> [PVS\_HANA\_IPS](#output\_PVS\_HANA\_IPS) | n/a |
<!-- END_TF_DOCS -->
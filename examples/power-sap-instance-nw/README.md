# PowerVS Instance Module Example For Netweaver

It creates:
- Instance on PowerVS, 
- Creates and attaches volumes
- Attaches private networks
- Os Initialization ( Prepare Os for NetWeaver, Create files systems)

This example illustrates how to use the `power-sap-instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_netweaver"></a> [netweaver](#module\_netweaver) | ../../modules/power-sap-instance | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pvs_region"></a> [pvs\_region](#input\_pvs\_region) | IBM Cloud Region | `string` | n/a | yes |
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM Cloud Zone | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing PowerVS service resource group Name | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Existing Name of the PowerVS service | `string` | n/a | yes |
| <a name="input_pvs_instance_hostname"></a> [pvs\_instance\_hostname](#input\_pvs\_instance\_hostname) | Name of instance which will be created | `string` | `"nw-power"` | yes |
| <a name="input_pvs_sshkey_name"></a> [pvs\_sshkey\_name](#input\_pvs\_sshkey\_name) | Existing SSH key name | `string` | n/a | yes |
| <a name="input_pvs_instance_image_name"></a> [pvs\_instance\_image\_name](#input\_pvs\_instance\_image\_name) | Image Name for node | `string` | `"Linux-SUSE-SAP-15-3"` | yes |
| <a name="input_pvs_instance_sys_type"></a> [pvs\_instance\_sys\_type](#input\_pvs\_instance\_sys\_type) | Processor type e980 or s922 | `string` | `"s922"` | yes |
| <a name="input_pvs_instance_proc_type"></a> [pvs\_instance\_proc\_type](#input\_pvs\_instance\_proc\_type) | Dedicated or shared or uncapped processors | `string` | `"dedicated"` | yes |
| <a name="input_pvs_instance_processors"></a> [pvs\_instance\_processors](#input\_pvs\_instance\_processors) | Number of processors | `string` | `"4"` | yes |
| <a name="input_pvs_instance_memory"></a> [pvs\_instance\_memory](#input\_pvs\_instance\_memory) | Amount of memory | `string` | `"400"` | yes |
| <a name="input_pvs_instance_private_net_names"></a> [pvs\_instance\_private\_net\_names](#input\_pvs\_instance\_private\_net\_names) | Existing list of subnets name to be attached to node. First network has to be a management network | `list` | n/a | yes |
| <a name="input_pvs_instance_storage_config"></a> [pvs\_instance\_storage\_config](#input\_pvs\_instance\_storage\_config) | DISKS To be created and attached to node.Comma separated values | `map` | <pre>{<br>  "counts": "1,1",<br>  "disks_size": "50,60",<br>  "names": "usrsap,usrtrans",<br>  "paths": "/usr/sap,/usr/sap/trans",<br>  "tiers": "tier3,tier3"<br>}</pre> | optional |
| <a name="input_proxy_config"></a> [proxy\_config](#input\_proxy\_config) | Value either SNAT or SQUID to use as proxy | `string` | n/a | yes |
| <a name="input_bastion_public_ip"></a> [bastion\_public\_ip](#input\_bastion\_public\_ip) | Public IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_bastion_private_ip"></a> [bastion\_private\_ip](#input\_bastion\_private\_ip) | Private IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | Private Key to configure Instance, Will not be uploaded to server | `string` | n/a | yes |
| <a name="input_os_activation"></a> [os\_activation](#input\_os\_activation) | Suse/RHEL activation username and password to register OS | `map` | <pre>{<br>  "activation_password": "",<br>  "activation_username": "",<br>  "required": false<br>}</pre> | optional |
| <a name="input_sap_domain"></a> [sap\_domain](#input\_sap\_domain) | Domain name to be set. Required when deploying RHEL system. | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | IBM Cloud Api Key | `string` | `null` | optional |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_BASTION_PUBLIC_IP"></a> [BASTION\_PUBLIC\_IP](#output\_BASTION\_PUBLIC\_IP) | Public IP of Provided Bastion/JumpServer Host |
| <a name="output_PVS_NW_IPS"></a> [PVS\_NW\_IPS](#output\_PVS\_NW\_IPS) | All private IPS of NetWeaver instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
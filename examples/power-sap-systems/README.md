# PowerVS SAP SYSTEM

It creates empty SAP SYSTEM landscape: 
- 1 SAP network and attaches it to Cloud connection
- 1 HANA instance on e980 PowerVS with specified volumes
- N number of Netweaver instances on s922 PowerVS 

This example illustrates how to use the `power-sap-instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hana"></a> [hana](#module\_hana) | ../../modules/power-sap-instance | n/a |
| <a name="module_netweaver"></a> [netweaver](#module\_netweaver) | ../../modules/power-sap-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_pi_cloud_connection_network_attach.pvs_subnet_attach](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_cloud_connection_network_attach) | resource |
| [ibm_pi_network.sap_network](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_network) | resource |
| [ibm_pi_cloud_connection.cloud_connection_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_cloud_connection) | data source |
| [ibm_resource_group.resource_group_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |
| [ibm_resource_instance.pvs_service_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| <a name="input_pvs_region"></a> [pvs\_region](#input\_pvs\_region) | IBM Cloud Region | `string` | n/a | yes |
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM Cloud Zone | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing PowerVS service resource group Name | `string` | n/a | yes |
| <a name="input_brownfield"></a> [brownfield](#input\_brownfield) | Existing Cloud PowerVS Service project. Set to true | `bool` | `true` | no |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Existing Name of the PowerVS service | `string` | n/a | yes |
| <a name="input_pvs_sshkey_name"></a> [pvs\_sshkey\_name](#input\_pvs\_sshkey\_name) | Existing SSH key name | `string` | n/a | yes |
| <a name="input_pvs_instance_image_name"></a> [pvs\_instance\_image\_name](#input\_pvs\_instance\_image\_name) | Image Name for node | `string` | `"Linux-SUSE-SAP-12-4"` | no |
| <a name="input_pvs_instance_private_net_names"></a> [pvs\_instance\_private\_net\_names](#input\_pvs\_instance\_private\_net\_names) | Existing list of subnets name to be attached to node. First network has to be a management network | `list` | n/a | yes |
| <a name="input_pvs_instance_sap_network"></a> [pvs\_instance\_sap\_network](#input\_pvs\_instance\_sap\_network) | New Network for SAP system | `map` | <pre>{<br>  "cidr": "10.111.1.1/24",<br>  "name": "sap_net"<br>}</pre> | no |
| <a name="input_cloud_connection_name"></a> [cloud\_connection\_name](#input\_cloud\_connection\_name) | Existing cloud connection name, to attach the new sap network | `string` | n/a | yes |
| <a name="input_pvs_hana_instance_hostname"></a> [pvs\_hana\_instance\_hostname](#input\_pvs\_hana\_instance\_hostname) | Name of hana instance which will be created | `string` | n/a | yes |
| <a name="input_pvs_hana_instance_profile_id"></a> [pvs\_hana\_instance\_profile\_id](#input\_pvs\_hana\_instance\_profile\_id) | SAP PROFILE ID for hana instance. If this is mentioned then Memory, processors, proc\_type and sys\_type will not be taken into account | `string` | `"ush1-4x128"` | no |
| <a name="input_pvs_hana_instance_storage_config"></a> [pvs\_hana\_instance\_storage\_config](#input\_pvs\_hana\_instance\_storage\_config) | DISKS To be created and attached to hana node.Comma separated values | `map` | {<br>  "counts": "8,8,1,1"<br>  "disks_size": "180,200,300,50"<br>  "names": "data,log,shared,usrsap"<br>  "paths": "/hana/data,/hana/log,/hana/shared,/usr/sap"<br>  "tiers": "tier1,tier1,tier3,tier3"<br>} | no |
| <a name="input_pvs_nw_instance_hostname"></a> [pvs\_nw\_instance\_hostname](#input\_pvs\_nw\_instance\_hostname) | Name of nw instances which will be created | `string` | `"nw"` | no |
| <a name="input_pvs_nw_instance_count"></a> [pvs\_nw\_instance\_count](#input\_pvs\_nw\_instance\_count) | Number of NetWeaver instances to be created | `number` | `2` | no |
| <a name="input_pvs_nw_instance_proc_type"></a> [pvs\_nw\_instance\_proc\_type](#input\_pvs\_nw\_instance\_proc\_type) | Dedicated or shared or uncapped processors | `string` | `"dedicated"` | no |
| <a name="input_pvs_nw_instance_processors"></a> [pvs\_nw\_instance\_processors](#input\_pvs\_nw\_instance\_processors) | Number of processors | `string` | `"4"` | no |
| <a name="input_pvs_nw_instance_memory"></a> [pvs\_nw\_instance\_memory](#input\_pvs\_nw\_instance\_memory) | Amount of memory | `string` | `"400"` | no |
| <a name="input_pvs_nw_instance_storage_config"></a> [pvs\_nw\_instance\_storage\_config](#input\_pvs\_nw\_instance\_storage\_config) | DISKS To be created and attached to nw nodes.Comma separated values | `map` | <pre>{<br>  "counts": "1,1",<br>  "disks_size": "50,60",<br>  "names": "usrsap,usrtrans",<br>  "paths": "/usr/sap,/usr/sap/trans",<br>  "tiers": "tier3,tier3"<br>}</pre> | no |
| <a name="input_proxy_config"></a> [proxy\_config](#input\_proxy\_config) | Value either SNAT or SQUID to use as proxy | `string` | n/a | yes |
| <a name="input_bastion_public_ip"></a> [bastion\_public\_ip](#input\_bastion\_public\_ip) | Public IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_bastion_private_ip"></a> [bastion\_private\_ip](#input\_bastion\_private\_ip) | Private IP of Bastion/jumpserver Host | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | Private Key to configure Instance, Will not be uploaded to server | `string` | n/a | yes |
| <a name="input_vpc_address_prefix"></a> [vpc\_address\_prefix](#input\_vpc\_address\_prefix) | Existing Address prefix of VPC to reach the HANA/NW node from machine on vpc | `string` | `""` | no |
| <a name="input_suse_activation"></a> [suse\_activation](#input\_suse\_activation) | Suse activation email and code to register for suse | `map` | <pre>{<br>  "activation_code": "",<br>  "activation_email": "",<br>  "required": false<br>}</pre> | no |
| <a name="input_sap_solution"></a> [sap\_solution](#input\_sap\_solution) | To Execute Playbooks for Hana or NetWeaver. Value can be either HANA OR NETWEAVER | `string` | `"HANA"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | IBM Cloud Api Key | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_BASTION_PUBLIC_IP"></a> [BASTION\_PUBLIC\_IP](#output\_BASTION\_PUBLIC\_IP) | n/a |
| <a name="output_PVS_HANA_IPS"></a> [PVS\_HANA\_IPS](#output\_PVS\_HANA\_IPS) | n/a |
| <a name="output_PVS_NW_IPS"></a> [PVS\_NW\_IPS](#output\_PVS\_NW\_IPS) | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.

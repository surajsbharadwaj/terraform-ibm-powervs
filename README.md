# PowerVS Infrastructure Module Example

This example does the following jobs:
- Creates the PowerVS service 
- Creates A ssh key
- Creates 2 private networks: management network and backup network
- Creates 2 cloud connections/ option to reuse cloud connections
- Attaches the cloud connections to transit gateway 
- Attaches the private networks to cloud connections


This example illustrates how to use the `power-infrastructure` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pvs"></a> [pvs](#module\_pvs) | ./modules/power-infrastructure | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_schematics_workspace.schematics_workspace](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/schematics_workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | IBM cloud schematics workspace ID to reuse values from other workspaces | `string` | `""` | no |
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM Cloud PVS Zone. Valid values: sao01,osa21,tor01,us-south,dal12,us-east,tok04,lon04,lon06,eu-de-1,eu-de-2,syd04,syd05 | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing Resource Group Name | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for resources which will be created. | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Name of PowerVS service which will be created | `string` | `"power-service"` | no |
| <a name="input_pvs_sshkey_name"></a> [pvs\_sshkey\_name](#input\_pvs\_sshkey\_name) | Name of PowerVS SSH Key which will be created | `string` | `"ssh-key-pvs"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Public SSH Key for PowerVM creation | `string` | n/a | yes |
| <a name="input_pvs_management_network"></a> [pvs\_management\_network](#input\_pvs\_management\_network) | PowerVS Management Subnet name and cidr which will be created. | `map` | <pre>{<br>  "cidr": "10.51.0.0/24",<br>  "name": "mgmt_net"<br>}</pre> | no |
| <a name="input_pvs_backup_network"></a> [pvs\_backup\_network](#input\_pvs\_backup\_network) | PowerVS Backup Network name and cidr which will be created. | `map` | <pre>{<br>  "cidr": "10.52.0.0/24",<br>  "name": "bkp_net"<br>}</pre> | no |
| <a name="input_transit_gw_name"></a> [transit\_gw\_name](#input\_transit\_gw\_name) | Name of the existing transit gateway. If empty / null, cloud connections will be reused. | `string` | `null` | no |
| <a name="input_cloud_connection_count"></a> [cloud\_connection\_count](#input\_cloud\_connection\_count) | Required number of Cloud connections which will be created. Ignore when Transit gateway is empty. Maximum is 2 per location | `string` | `2` | no |
| <a name="input_cloud_connection_speed"></a> [cloud\_connection\_speed](#input\_cloud\_connection\_speed) | Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000. Required when creating new connection | `string` | `"5000"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag names for PowerVS service | `list(string)` | `null` | no |
| <a name="input_cloud_connection_gr"></a> [cloud\_connection\_gr](#input\_cloud\_connection\_gr) | Enable global routing for this cloud connection.Can be specified when creating new connection | `bool` | `true` | no |
| <a name="input_cloud_connection_metered"></a> [cloud\_connection\_metered](#input\_cloud\_connection\_metered) | Enable metered for this cloud connection. Can be specified when creating new connection | `bool` | `false` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | IBM Cloud Api Key | `string` | `null` | no |
| <a name="input_ibm_pvs_zone_region_map"></a> [ibm\_pvs\_zone\_region\_map](#input\_ibm\_pvs\_zone\_region\_map) | Map of IBM Power VS zone to the region of PowerVS Infrastructure | `map` | <pre>{<br>  "dal12": "us-south",<br>  "eu-de-1": "eu-de",<br>  "eu-de-2": "eu-de",<br>  "lon04": "lon",<br>  "lon06": "lon",<br>  "osa21": "osa",<br>  "sao01": "sao",<br>  "syd04": "syd",<br>  "syd05": "syd",<br>  "tok04": "tok",<br>  "tor01": "tor",<br>  "us-east": "us-east",<br>  "us-south": "us-south"<br>}</pre> | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
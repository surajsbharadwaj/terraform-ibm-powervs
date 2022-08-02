# PowerVS Infrastructure Module

It does the following jobs:
- Creates the PowerVS service 
- Creates A ssh key
- Creates 2 private networks: management network and backup network
- Creates 2 cloud connections/ option to reuse cloud connections
- Attaches the cloud connections to transit gateway 
- Attaches the private networks to cloud connections

## Example Usage
```
provider "ibm" {
  region    =   lookup(var.ibm_pvs_zone_region_map,var.pvs_zone, null)
  zone      =   var.pvs_zone
  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}

data "ibm_schematics_workspace" "schematics_workspace" {
    count        = var.workspace_id != null && var.workspace_id != "" ? 1 : 0 
    workspace_id = var.workspace_id
}

locals {
  workspace_values = var.workspace_id != null && var.workspace_id != "" ? data.ibm_schematics_workspace.schematics_workspace.0.template_inputs : null
}

module "power-infrastructure" {
  source = "terraform-ibm-modules/powervs/ibm/modules/powervs-infrastructure"

  pvs_zone                    = var.pvs_zone
  pvs_resource_group_name     = var.pvs_resource_group_name
  pvs_service_name            = var.workspace_id != null && var.workspace_id != "" ? "${local.workspace_values[index(local.workspace_values.*.name,"prefix")].value}-${var.pvs_service_name}" : "${var.prefix}-${var.pvs_service_name}"
  tags                        = var.tags
  pvs_sshkey_name             = var.workspace_id != null && var.workspace_id != "" ? "${local.workspace_values[index(local.workspace_values.*.name,"prefix")].value}-${var.pvs_sshkey_name}" : "${var.prefix}-${var.pvs_sshkey_name}"
  ssh_public_key              = var.workspace_id != null && var.workspace_id != "" ? local.workspace_values[index(local.workspace_values.*.name,"ssh_public_key")].value : var.ssh_public_key
  pvs_management_network      = var.pvs_management_network
  pvs_backup_network          = var.pvs_backup_network
  transit_gw_name             = var.transit_gw_name
  cloud_connection_count      = var.cloud_connection_count
  cloud_connection_speed      = var.cloud_connection_speed
  cloud_connection_gr         = var.cloud_connection_gr
  cloud_connection_metered    = var.cloud_connection_metered
  ibmcloud_api_key            = var.ibmcloud_api_key
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_power-service"></a> [power-service](#module\_power-service) | ./power-service | n/a |
| <a name="module_cloud-connection-create"></a> [cloud-connection-create](#module\_cloud-connection-create) | ./power-cloudconnection-create | n/a |
| <a name="module_cloud-connection-attach"></a> [cloud-connection-attach](#module\_cloud-connection-attach) | ./power-cloudconnection-attach | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM PowerVS Cloud Zone. | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing Resource Group Name | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Name of PowerVS service which will be created | `string` | n/a | yes |
| <a name="input_pvs_sshkey_name"></a> [pvs\_sshkey\_name](#input\_pvs\_sshkey\_name) | Name of PowerVS SSH Key which will be created | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Public SSH Key for PowerVM creation | `string` | n/a | yes |
| <a name="input_pvs_management_network"></a> [pvs\_management\_network](#input\_pvs\_management\_network) | PowerVS Management Subnet name and cidr which will be created. | `map` | <pre>{<br>  "cidr": "10.51.0.0/24",<br>  "name": "mgmt_net"<br>}</pre> | no |
| <a name="input_pvs_backup_network"></a> [pvs\_backup\_network](#input\_pvs\_backup\_network) | PowerVS Backup Network name and cidr which will be created. | `map` | <pre>{<br>  "cidr": "10.52.0.0/24",<br>  "name": "bkp_net"<br>}</pre> | no |
| <a name="input_transit_gw_name"></a> [transit\_gw\_name](#input\_transit\_gw\_name) | Name of the existing transit gateway. If empty / null, cloud connections will be reused. | `string` | `null` | no |
| <a name="input_cloud_connection_count"></a> [cloud\_connection\_count](#input\_cloud\_connection\_count) | Required number of Cloud connections which will be created. Ignore when Transit gateway is empty. Maximum is 2 per location | `string` | `2` | no |
| <a name="input_cloud_connection_speed"></a> [cloud\_connection\_speed](#input\_cloud\_connection\_speed) | Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000. Required when creating new connection | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag names for PowerVS service | `list(string)` | `null` | no |
| <a name="input_cloud_connection_gr"></a> [cloud\_connection\_gr](#input\_cloud\_connection\_gr) | Enable global routing for this cloud connection.Can be specified when creating new connection | `bool` | `null` | no |
| <a name="input_cloud_connection_metered"></a> [cloud\_connection\_metered](#input\_cloud\_connection\_metered) | Enable metered for this cloud connection. Can be specified when creating new connection | `bool` | `null` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | IBM Cloud Api Key | `string` | `null` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
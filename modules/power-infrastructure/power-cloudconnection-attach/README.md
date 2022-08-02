# Submodule power-cloudconnection-attach

This submodule is used to attach PowerVS subnets to cloud connections 

## Example Usage
```
provider "ibm" {
  region           = "sao"
  zone             = "sao01"
  ibmcloud_api_key = "your api key" != null ? "your api key" : null
}

module "cloud-connection-attach" {
  source  = "./power-cloudconnection-attach"
  pvs_zone                    = var.pvs_zone   
  pvs_resource_group_name     = var.pvs_resource_group_name
  pvs_service_name            = var.pvs_service_name
  pvs_subnet_names            = [var.pvs_management_network.name,var.pvs_backup_network.name]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_pi_cloud_connection_network_attach.pvs_subnet_attach](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_cloud_connection_network_attach) | resource |
| [ibm_pi_cloud_connection_network_attach.pvs_subnet_attach2](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_cloud_connection_network_attach) | resource |
| [ibm_pi_cloud_connection_network_attach.pvs_subnet_attach3](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_cloud_connection_network_attach) | resource |
| [ibm_pi_cloud_connection_network_attach.pvs_subnet_attach4](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_cloud_connection_network_attach) | resource |
| [ibm_pi_cloud_connections.cloud_connection_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_cloud_connections) | data source |
| [ibm_pi_network.pvs_subnets_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_network) | data source |
| [ibm_resource_group.resource_group_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |
| [ibm_resource_instance.pvs_service_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM PowerVS Cloud Zone | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing Resource Group Name | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Existing PowerVS Service Name | `string` | n/a | yes |
| <a name="input_pvs_subnet_names"></a> [pvs\_subnet\_names](#input\_pvs\_subnet\_names) | List of PowerVs subnet names to be attached to Cloud connection | `list` | n/a | yes |
| <a name="input_cloud_connection_count"></a> [cloud\_connection\_count](#input\_cloud\_connection\_count) | Required number of Cloud connections which will be created. Ignore when Transit gateway is empty. Maximum is 2 per location | `string` | `2` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
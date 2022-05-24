# Module power-sap-vpc-pvs-cloudconnection

This module is used to create/reuse a Cloud Connection

## Example Usage
```
provider "ibm" {
  region           =   "sao"
  zone             =   "sao01"
  ibmcloud_api_key = "your api key" != null ? "your api key" : null
}

module "cloud-connection" {
  //source = "terraform-ibm-modules/powervs/ibm//modules/cloud-connection"

  pvs_zone                    = var.pvs_zone   
  pvs_resource_group_name     = var.pvs_resource_group_name
  pvs_service_name            = var.pvs_service_name
  cloud_connection_reuse      = var.cloud_connection_reuse
  cloud_connection_name       = var.cloud_connection_name
  cloud_connection_count      = var.cloud_connection_count
  cloud_connection_speed      = var.cloud_connection_speed
  pvs_subnet_names            = var.pvs_subnet_names
  ibmcloud_api_key            = var.ibmcloud_api_key
  cloud_connection_vpc_enable = var.cloud_connection_vpc_enable
  vpc_region                  = var.vpc_region
  vpc_crns                    = var.vpc_crns
  cloud_connection_gr         = var.cloud_connection_gr
  cloud_connection_metered    = var.cloud_connection_metered
  
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_zone | IBM Cloud zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing Name of PowerVS service | string | n/a | yes |
| cloud\_connection\_reuse | Resuse existing Cloud connection to attach PVS subnets | bool | n/a | yes |
| cloud\_connection\_name | Name of the Cloud connection which will be created/ Reused to attach subnets | string | n/a | yes |
| cloud\_connection\_count | Required number of Cloud connections. Ignore when Reusing  | string | 2| yes |
| cloud\_connection\_speed | Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000. Required when creating new connection | string | null | yes |
| pvs\_subnet\_names | List of PowerVs subnet names to be attached to Cloud connection | list | n/a | yes |
| ibmcloud\_api\_key | Cloud Api Key for provider | string | null | optional |
| cloud\_connection\_vpc_enable | Enable VPC for this cloud connection. Required when creating new connection  | bool | false | optional |
| vpc\_region | IBM Cloud zone. Required when creating new connection  | string | null | optional |
| vpc\_crns | Existing VPC Crns which has to be attached to Cloud connection.Required when creating new connection | list | null | optional |
| cloud\_connection\_gr | Enable global routing for this cloud connection.Can be specified when creating new connection | bool | null | optional |
| cloud\_connection\_metered | Enable metered for this cloud connection. Can be specified when creating new connection | bool | null | optional |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
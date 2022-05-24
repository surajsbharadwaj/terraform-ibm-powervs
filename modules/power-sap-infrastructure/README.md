# PowerVS Infrastructure for SAP Module

It creates:
- PVS service
- ssh key
- 2 private networks for management network and backup network
- 1 public network
- imports stock sap catalogue images.
- Creates one or 2 cloud connections and attaches VPC and PowerVS subnets
- Option to resuse Cloud connection to attach new PowerVS subnets

## Example Usage
```
provider "ibm" {
  region    =   "sao"
  zone      =   "sao01"
  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}

module "power-sap-infrastructure" {
  source = "terraform-ibm-modules/powervs/ibm/modules/power-sap-infrastructure"

  pvs_zone                    = var.pvs_zone
  pvs_resource_group_name     = var.pvs_resource_group_name
  pvs_service_name            = var.pvs_service_name
  pvs_tags                    = var.pvs_tags
  pvs_sshkey_name             = var.pvs_sshkey_name
  pvs_public_key              = var.pvs_public_key
  pvs_image_names             = var.pvs_image_names
  pvs_public_network_name     = var.pvs_public_network_name
  pvs_management_network      = var.pvs_management_network
  pvs_backup_network          = var.pvs_backup_network
  cloud_connection_reuse      = var.cloud_connection_reuse
  cloud_connection_name       = var.cloud_connection_name
  cloud_connection_count      = var.cloud_connection_count
  cloud_connection_speed      = var.cloud_connection_speed
  pvs_subnet_names            = [var.pvs_management_network.name,var.pvs_backup_network]
  cloud_connection_vpc_enable = var.cloud_connection_vpc_enable
  ibmcloud_api_key            = var.ibmcloud_api_key
  vpc_region                  = var.vpc_region
  vpc_names                   = var.vpc_names
  cloud_connection_gr         = var.cloud_connection_gr
  cloud_connection_metered    = var.cloud_connection_metered
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_ibmcloud_api_key | IBM cloud API key | string | null | optional |
| pvs\_zone | IBM Cloud Zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Name of PowerVS service which will be created | string | n/a | yes |
| pvs\_tags | List of Tag names for PowerVS service | list(string) | null | no |
| pvs\_sshkey\_name | Name of PowerVS SSH Key which will be created  | string | n/a | yes |
| pvs\_public\_key | PowerVS SSH Public key data | string | n/a | yes |
| pvs\_image\_names | List of Images to be imported into cloud account from catalog images | list(string) | ["Linux-SUSE-SAP-12-4","Linux-RHEL-SAP-8-1"] | yes |
| pvs\_public\_network\_name | Name of PowerVS Public Network which will be created  | string | public_net | yes |
| pvs\_management\_network | PowerVS Management Subnet name and cidr which will be created. | map | n/a | yes |
| pvs\_backup\_network | PowerVS Backup Network name and cidr which will be created. | map | n/a | yes |
| cloud\_connection\_reuse | Resuse existing Cloud connection to attach PVS subnets | bool | n/a | yes |
| cloud\_connection\_name | Name of the Cloud connection which will be created/ Reused to attach subnets | string | n/a | yes |
| cloud\_connection\_count | Required number of Cloud connections. Ignore when Reusing  | string | 2| yes |
| cloud\_connection\_speed | Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000. Required when creating new connection | string | null | yes |
| ibmcloud\_api\_key | Cloud Api Key for provider | string | null | optional |
| cloud\_connection\_vpc_enable | Enable VPC for this cloud connection. Required when creating new connection  | bool | false | optional |
| vpc\_region | IBM Cloud zone. Required when creating new connection  | string | null | optional |
| vpc\_names | Existing VPC Names which has to be attached to Cloud connection. Required when creating new connection | list | null | optional |
| cloud\_connection\_gr | Enable global routing for this cloud connection.Can be specified when creating new connection | bool | null | optional |
| cloud\_connection\_metered | Enable metered for this cloud connection. Can be specified when creating new connection | bool | null | optional |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
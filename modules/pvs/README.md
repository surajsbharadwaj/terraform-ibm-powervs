# Module powervs_service

This module is used to create a PowerVS service, SSH Key, import images, Pulic network and 3 Private Subnets

## Example Usage
```
provider "ibm" {
  region    =   "sao"
  zone      =   "sao01"
}

module "pvs" {
  source = "terraform-ibm-modules/powervs/ibm//modules/pvs"

  pvs_zone                  = var.pvs_zone
  pvs_resource_group_name   = var.pvs_resource_group_name
  pvs_service_name          = var.pvs_service_name
  pvs_tags                  = var.pvs_tags
  pvs_sshkey_name           = var.pvs_sshkey_name
  pvs_public_key            = var.pvs_public_key
  pvs_image_names           = var.pvs_image_names
  pvs_public_network_name   = var.pvs_public_network_name
  pvs_management_network    = var.pvs_management_network
  pvs_sap_network           = var.pvs_sap_network
  pvs_backup_network        = var.pvs_backup_network
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_zone | IBM Cloud zone | string | n/a | yes |
| pvs\_resource\_group\_name | Exisiting Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Name of PowerVS service which will be created | string | n/a | yes |
| pvs\_tags | List of Tag names for PowerVS service | list(string) | n/a | no |
| pvs\_sshkey\_name | Name of PowerVS SSH Key which will be created  | string | n/a | yes |
| pvs\_public\_key | PowerVS SSH Public key data | string | n/a | yes |
| pvs\_image\_names | List of Images to be imported into cloud account from catalog images | list(string) | ["Linux-SUSE-SAP-12-4","Linux-RHEL-SAP-8-1"] | yes |
| pvs\_public\_network\_name | Name of PowerVS Public Network which will be created  | string | public_net | yes |
| pvs\_management\_network | PowerVS Management Subnet name and cidr which will be created. | map | n/a | yes |
| pvs\_sap\_network | PowerVS SAP Subnet name and cidr which will be created. | map | n/a | yes |
| pvs\_backup\_network | PowerVS Backup Network name and cidr which will be created. | map | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
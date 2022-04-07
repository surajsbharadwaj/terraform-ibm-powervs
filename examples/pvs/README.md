# Module powervs_service

This example illustrates how to use the powervs_service module.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_region | IBM Cloud Region | string | n/a | yes |
| pvs\_zone | IBM Cloud Zone | string | n/a | yes |
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

NOTE: We can configure the list of tags to be attached to a VPC by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
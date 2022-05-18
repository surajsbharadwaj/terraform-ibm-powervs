# PowerVS Service Module Example

It creates PVS service, ssh key, 3 private networks, 1 public network and imports stock sap catalogue images.

This example illustrates how to use the `pvs` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_ibmcloud_api_key | IBM cloud API key | string | null | optional |
| pvs\_region | IBM Cloud Region | string | n/a | yes |
| pvs\_zone | IBM Cloud Zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Name of PowerVS service which will be created | string | n/a | yes |
| pvs\_tags | List of Tag names for PowerVS service | list(string) | null | no |
| pvs\_sshkey\_name | Name of PowerVS SSH Key which will be created  | string | n/a | yes |
| pvs\_public\_key | PowerVS SSH Public key data | string | n/a | yes |
| pvs\_image\_names | List of Images to be imported into cloud account from catalog images | list(string) | ["Linux-SUSE-SAP-12-4","Linux-RHEL-SAP-8-1"] | yes |
| pvs\_public\_network\_name | Name of PowerVS Public Network which will be created  | string | public_net | yes |
| pvs\_management\_network | PowerVS Management Subnet name and cidr which will be created. | map | n/a | yes |
| pvs\_sap\_network | PowerVS SAP Subnet name and cidr which will be created. | map | n/a | yes |
| pvs\_backup\_network | PowerVS Backup Network name and cidr which will be created. | map | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
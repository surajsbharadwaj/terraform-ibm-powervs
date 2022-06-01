# PowerVS Instance Module Example for HANA

It creates an instance on PowerVS, Creates volumes, attaches volumes and attaches private networks

This example illustrates how to use the `power-sap-instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_ibmcloud_api_key | IBM cloud API key | string | null | optional |
| pvs\_region | IBM Cloud Region | string | n/a | yes |
| pvs\_zone | IBM Cloud Zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing Name of PowerVS service | string | n/a | yes |
| pvs\_instance\_hostname | Name of instance which will be created | string | hana-power | yes |
| pvs\_sshkey\_name | Existing Name of PowerVS SSH Key | string | n/a | yes |
| pvs\_instance\_image\_name | Image Name for node | string | Linux-SUSE-SAP-12-4 | yes |
| pvs\_instance\_profile\_id | SAP PROFILE ID. If this is mentioned then Memory, processors, proc_type and sys_type will not be taken into account | string | ush1-4x128 | yes |
| pvs\_instance\_private\_net\_names | Existing list of subnets name to be attached to node. First network has to be a management network  | list | n/a | yes |
| pvs\_instance\_storage\_config | DISKS To be created and attached to node.Comma separated values | map | {<br />names = "data,log,shared,usrsap"<br />paths = "/hana/data,/hana/log,/hana/shared,/usr/sap"<br />disks\_size = "160,150,300,50"<br />counts = "8,8,1,1"<br />tiers  = "tier1,tier1,tier3,tier3"<br />} | yes |
| proxy\_config | Value either SNAT or SQUID for configuring internet for SAP instances | string | n/a | yes |
| bastion\_public\_ip | Public IP of Bastion/Jumpserver Host | string | n/a | yes |
| bastion\_private\_ip | Private IP of Bastion/Jumpserver | string | n/a | yes |
| ssh\_private\_key | Private Key to confgure Instance, Will not be uploaded to server | string | n/a | yes |
| vpc\_address\_prefix | Existing Address prefix of VPC to reach the HANA node from machine on vpc | string | n/a | yes |
| suse\_activation | Suse activation email and code to register for suse | map | {<br />required = false<br />activation\_email = ""<br />activation\_code  = ""<br />} | yes |


## Outputs

| Name                              | Description                                           | Type   |
|-----------------------------------|-------------------------------------------------------|--------|
| BASTION\_PUBLIC\_IP | Public of Jumpserver | string |
| PVS\_HANA\_IPS | HANA private IPs | list |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
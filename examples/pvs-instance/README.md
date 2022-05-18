# PowerVS Instance Module Example

It creates an instance on PowerVS, Creates volumes, attaches volumes and attaches private networks

This example illustrates how to use the `pvs-instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_ibmcloud_api_key | IBM cloud API key | string | null | optional |
| pvs\_region | IBM Cloud Region | string | n/a | yes |
| pvs\_zone | IBM Cloud Zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing Name of PowerVS service | string | n/a | yes |
| pvs\_instance\_hostname | Name of instance which will be created | string | n/a | yes |
| pvs\_sshkey\_name | Existing Name of PowerVS SSH Key | string | n/a | yes |
| pvs\_instance\_image\_name | Image Name for node | string | Linux-SUSE-SAP-12-4 | yes |
| pvs\_instance\_profile\_id | SAP PROFILE ID. If this is mentioned then Memory, processors, proc_type and sys_type will not be taken into account | string | null | optional |
| pvs\_instance\_sys\_type | Processor type e980 or s922 | string | null | optional |
| pvs\_instance\_proc\_type | Dedicated or shared processors | string | null | optional |
| pvs\_instance\_processors | Number of processors | string | null | optional |
| pvs\_instance\_memory | Amount of memory | string | null | optional |
| pvs\_instance\_private\_net\_names | Existing list of subnets name to be attached to node. First network has to be a management network  | list | n/a | yes |
| pvs\_instance\_storage\_config | DISKS To be created and attached to node.Comma separated values | map | n/a | yes |  

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
# Module cloud-connection-create

This example is used to create a new Cloud Connection

This example illustrates how to use the `cloud-connection-create` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_ibmcloud_api_key | IBM cloud API key | string | null | optional |
| pvs\_region | IBM Cloud region | string | n/a | yes |
| pvs\_zone | IBM Cloud zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing Name of PowerVS service | string | n/a | yes |
| cloud\_connection\_name | Name of the Cloud connection which will be created | string | n/a | yes |
| cloud\_connection\_count | Required number of Cloud connections | string | n/a | yes |
| cloud\_connection\_speed | Speed in megabits per sec. Supported values are 50, 100, 200, 500, 1000, 2000, 5000, 10000 | string | n/a | yes |
| pvs\_subnet\_names | List of PowerVs subnet names to be attached to Cloud connection | list | n/a | yes |
| ibmcloud\_api\_key | Cloud Api Key for provider | string | null | optional |
| cloud\_connection\_vpc_enable | Enable VPC for this cloud connection | bool | n/a | yes |
| vpc\_region | IBM Cloud zone | string | null | yes |
| vpc\_name | Existing VPC Name which has to be attached to Cloud connection | string | null | yes |
| cloud\_connection\_gr | Enable global routing for this cloud connection | bool | n/a | yes |
| cloud\_connection\_metered | Enable metered for this cloud connection | bool | n/a | yes |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars 

## Usage

terraform apply -var-file="input.tfvars"
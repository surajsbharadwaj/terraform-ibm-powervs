# PowerVS image-import Module Example

This example is used to import an image from catalogue images into cloud account if the image doest exist in cloud account.

This example illustrates how to use the `image-import` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_ibmcloud_api_key | IBM cloud API key | string | null | optional |
| pvs\_region | IBM Cloud region | string | n/a | yes |
| pvs\_zone | IBM Cloud zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing PowerVS Service Name | string | n/a | yes |
| pvs\_image_name | Name of Image to import | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars 

## Usage

terraform apply -var-file="input.tfvars"
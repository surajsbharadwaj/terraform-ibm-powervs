# PowerVS image-import Module Example

This module is used to import an image from catalogue images into cloud account if the image doest exist in cloud account.

This example illustrates how to use the `image-import` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Example Usage
```
provider "ibm" {
  region    =   "sao"
  zone      =   "sao01"
}

module "import_image" {
  source = "terraform-ibm-modules/powervs/ibm//modules/image-import"

  pvs_zone                  = var.pvs_zone
  pvs_resource_group_name   = var.pvs_resource_group_name
  pvs_service_name          = var.pvs_service_name
  pvs_image_name            = var.pvs_image_name
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| pvs\_zone | IBM Cloud zone | string | n/a | yes |
| pvs\_resource\_group\_name | Existing Resource Group Name | string | n/a | yes |
| pvs\_service\_name | Existing PowerVS Service Name | string | n/a | yes |
| pvs\_image_name | Name of Image to import | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the all details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"
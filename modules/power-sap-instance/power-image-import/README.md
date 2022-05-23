# Module image-import

This module is used to import an image from catalogue images into cloud account if the image doesn't exist in cloud account

## Example Usage
```
provider "ibm" {
  region           = "sao"
  zone             = "sao01"
  ibmcloud_api_key = "your api key" != null ? "your api key" : null
}

module "import_image" {
  source = "terraform-ibm-modules/powervs/ibm/modules/image-import"

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
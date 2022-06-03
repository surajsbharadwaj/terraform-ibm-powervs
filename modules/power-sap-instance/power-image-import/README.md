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

## Resources

| Name | Type |
|------|------|
| [ibm_pi_image.image](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_image) | resource |
| [ibm_pi_catalog_images.catalog_images_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_catalog_images) | data source |
| [ibm_pi_images.exisiting_images_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/pi_images) | data source |
| [ibm_resource_group.resource_group_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |
| [ibm_resource_instance.pvs_service_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pvs_zone"></a> [pvs\_zone](#input\_pvs\_zone) | IBM Cloud Zone | `string` | n/a | yes |
| <a name="input_pvs_resource_group_name"></a> [pvs\_resource\_group\_name](#input\_pvs\_resource\_group\_name) | Existing Resource Group Name | `string` | n/a | yes |
| <a name="input_pvs_service_name"></a> [pvs\_service\_name](#input\_pvs\_service\_name) | Existing PowerVS Service Name | `string` | n/a | yes |
| <a name="input_pvs_image_name"></a> [pvs\_image\_name](#input\_pvs\_image\_name) | Name of image to Import | `string` | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
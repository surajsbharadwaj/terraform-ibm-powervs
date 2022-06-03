# Module pvs-instance-sap-init-rhel

This module configures the PVS instance and prepares the system for SAP installation. 
- Configure Forward Proxy
- RHEL Registration
- Install Packages
- Run ansible galaxy roles to configure filesystems, prepare OS for HANA and netweaver installation

## Example Usage
```

module "instance-sap-init-rhel" {
  source = "terraform-ibm-modules/powervs/ibm/modules/pvs-instance-sap-init-rhel"

  bastion_public_ip            = var.bastion_public_ip
  host_private_ip              = var.host_private_ip
  ssh_private_key              = var.ssh_private_key
  vpc_bastion_proxy_config     = {
                                   required               = var.vpc_bastion_proxy_config[required] 
                                   vpc_bastion_private_ip = var.vpc_bastion_proxy_config[vpc_bastion_private_ip]
                                   no_proxy_ips           = var.vpc_bastion_proxy_config[no_proxy_ips]
                                 }
  os_activation                = var.os_activation                                
  pvs_instance_storage_config  = var.pvs_instance_storage_config
  sap_solution                 = var.sap_solution
  sap_domain                   = var.sap_domain
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Resources

| Name | Type |
|------|------|
| [null_resource.configure_proxy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.execute_ansible_role](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.install_packages](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.rhel_register](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_public_ip"></a> [bastion\_public\_ip](#input\_bastion\_public\_ip) | Public IP of Bastion Host | `string` | n/a | yes |
| <a name="input_host_private_ip"></a> [host\_private\_ip](#input\_host\_private\_ip) | Private IP of NetWeaver/HANA Host reachable from bastion | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | Private Key to configure Instance, Will not be uploaded to server | `string` | n/a | yes |
| <a name="input_vpc_bastion_proxy_config"></a> [vpc\_bastion\_proxy\_config](#input\_vpc\_bastion\_proxy\_config) | SQUID configuration if required on HANA/NetWeaver node to reach public internet via the Bastion host on VSI running SQUID server | `map` | <pre>{<br>  "no_proxy_ips": "",<br>  "required": false,<br>  "vpc_bastion_private_ip": ""<br>}</pre> | optional |
| <a name="input_os_activation"></a> [os\_activation](#input\_os\_activation) | RHEL activation email and code to register OS | `map` | <pre>{<br>  "activation_code": "",<br>  "activation_email": "",<br>  "required": false<br>}</pre> | optional |
| <a name="input_pvs_instance_storage_config"></a> [pvs\_instance\_storage\_config](#input\_pvs\_instance\_storage\_config) | Disks properties to create filesystems | `map` | <pre>{<br>  "counts": "",<br>  "disks_size": "",<br>  "names": "",<br>  "paths": "",<br>  "wwns": ""<br>}</pre> | optional |
| <a name="input_sap_solution"></a> [sap\_solution](#input\_sap\_solution) | To Execute Playbooks for Hana or NetWeaver. Value can be either HANA OR NETWEAVER | `string` | n/a | yes |
| <a name="input_sap_domain"></a> [sap\_domain](#input\_sap\_domain) | Domain name to be set | `string` | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

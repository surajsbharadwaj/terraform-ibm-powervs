# Module pvs-instance-sap-init-sles

This module configures the PVS instance and prepares the system for SAP installation. 
- Configure Forward Proxy
- SUSE Registration
- Install Packages
- Run ansible galaxy roles 

Note: prerequisite The bastion host must be running SQUID proxy server with 3128 port open. If squid server is not on bastion host, then pass the squid server public and private ips to variables `input_bastion_public_ip` and `input_bastion_private_ip`

## Example Usage
```

module "instance-sap-init-sles" {
  //source = "terraform-ibm-modules/powervs/ibm//modules/pvs-instance-sap-init-sles"

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
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Resources

| Name | Type |
|------|------|
| [null_resource.configure_proxy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.execute_ansible_role](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.install_packages](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.suse_register](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_public_ip"></a> [bastion\_public\_ip](#input\_bastion\_public\_ip) | Public IP of Bastion Host | `string` | n/a | yes |
| <a name="input_host_private_ip"></a> [host\_private\_ip](#input\_host\_private\_ip) | Private IP of NetWeaver/HANA Host reachable from bastion | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | Private Key to configure Instance, Will not be uploaded to server | `string` | n/a | yes |
| <a name="input_vpc_bastion_proxy_config"></a> [vpc\_bastion\_proxy\_config](#input\_vpc\_bastion\_proxy\_config) | SQUID configuration if required on HANA/nw node to reach public internet via the Bastion host on VSI running SQUID server | `map` | <pre>{<br>  "no_proxy_ips": "",<br>  "required": false,<br>  "vpc_bastion_private_ip": ""<br>}</pre> | optional |
| <a name="input_os_activation"></a> [os\_activation](#input\_os\_activation) | SUSE activation username, password and Os release to register Os. Release value should be in for x.x. For example SLES15 SP3, value would be 15.3 | `map` | <pre>{<br>  "activation_password": "",<br>  "activation_username": "",<br>  "required": false,<br>  "os_release":""<br>}</pre> | optional |
| <a name="input_pvs_instance_storage_config"></a> [pvs\_instance\_storage\_config](#input\_pvs\_instance\_storage\_config) | Disks properties to create filesystems | `map` | <pre>{<br>  "counts": "",<br>  "disks_size": "",<br>  "names": "",<br>  "paths": "",<br>  "wwns": ""<br>}</pre> | optional |
| <a name="input_sap_solution"></a> [sap\_solution](#input\_sap\_solution) | To Execute Playbooks for Hana or NetWeaver. Value can be either HANA OR NETWEAVER | `string` | n/a | yes |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

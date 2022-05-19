# PowerVS Instance SAP Institialization SLES Module Example

This example configures the PVS instance and prepares the system for SAP installation. 
- Add routes to VPC
- Configure SNAT
- Configure Forward Proxy
- SUSE Registeration
- Install Packages
- Run ansible galaxy roles 


This example illustrates how to use the `pvs-instance-sap-init-sles` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| bastion_public_ip | Public IP of Bastion Host | string | n/a | yes |
| host_private_ip | Private IP of Netweaver/HANA Host reachable from bastion | string | n/a | yes |
| ssh_private_key | Private Key to confgure Instance, Will not be uploaded to server | string | n/a | yes |
| vpc_address_prefix | Existing Address prefix of VPC to reach the HANA/NW node from machine on vpc | string | n/a | yes |
| pvs_bastion_snat_config | SNAT configuration if required on HANA/nw node to reach public internet via the Bastion host on Power Server | map | {<br />required = false<br />pvs_bastion_private_ip = ""<br />} | yes |
| vpc_bastion_proxy_config | SQUID configuration if required on HANA/nw node to reach public internet via the Bastion host on VSI running SQUID server | map | {<br />required = true<br />vpc_bastion_private_ip = ""<br />no_proxy_ips = ""<br />} | optional |
| suse_activation | Suse activation email and code to register for suse | map | {<br />required = false<br />activation_email = ""<br />activation_code  = ""<br />} | yes |
| pvs_instance_storage_config | Disks properties to create filesystems | map | {<br />names = ""<br />paths = ""<br />disks_size = ""<br />counts = ""<br />wwns  = ""<br />} | yes |
| sap_solution | To Execute Playbooks for Hana or Netweaver. Value can be either HANA OR NETWEAVER | string | n/a | yes |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure all details in input.tfvars

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.
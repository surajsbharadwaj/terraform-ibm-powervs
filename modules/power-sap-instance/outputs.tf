output "bastion_public_ip" {
  value      = var.bastion_public_ip
}

output "pvs_hana_ips" {
  value      = module.instance-sap.instance_private_ips
}

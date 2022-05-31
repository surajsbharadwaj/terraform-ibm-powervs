output "BASTION_PUBLIC_IP" {
  value      = module.hana.bastion_public_ip
}

output "PVS_HANA_IPS" {
  value      = module.hana.pvs_instance_ips
}

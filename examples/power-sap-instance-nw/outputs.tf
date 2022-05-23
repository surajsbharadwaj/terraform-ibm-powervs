output "BASTION_PUBLIC_IP" {
  value      = module.netweaver.bastion_public_ip
}

output "PVS_NW_IPS" {
  value      = module.netweaver.pvs_hana_ips
}

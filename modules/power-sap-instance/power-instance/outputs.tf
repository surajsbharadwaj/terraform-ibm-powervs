output "instance_private_ips" {
  value      = join(", ", [for ip in data.ibm_pi_instance.instance_ips_ds.addresses.*.ip : format("%s", ip)])
}

output "instance_private_ips_info" {
  value      = data.ibm_pi_network.pvs_subnets_ds
}

output "instance_mgmt_ip" {
  value      = data.ibm_pi_instance_ip.instance_mgmt_ip_ds.ip
}

output "instance_wwns" {
  depends_on = [ibm_pi_volume.create_volume]
  value      = ibm_pi_volume.create_volume[*].wwn
}
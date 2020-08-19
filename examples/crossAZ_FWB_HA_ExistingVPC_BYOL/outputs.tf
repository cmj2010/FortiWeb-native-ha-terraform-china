output "username" {
  value = "admin"
}

output "password" {
  value = "${module.fwb-ha.fwb1_id}"
}

output "fwb1_login_url" {
  value = "https://${module.fwb-ha.fwb1_hamgmt_eip_public_ip}"
}

output "fwb2_login_url" {
  value = "https://${module.fwb-ha.fwb2_hamgmt_eip_public_ip}"
}
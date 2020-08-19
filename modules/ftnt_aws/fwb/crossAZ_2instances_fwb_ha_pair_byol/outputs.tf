output "fwb1_id" {
  value = "${aws_instance.fwb1.id}"
}

output "fwb2_id" {
  value = "${aws_instance.fwb1.id}"
}

output "fwb1_hamgmt_eip_public_ip" {
  value = "${aws_eip.fwb1_hamgmt_eip.public_ip}"
}

output "fwb2_hamgmt_eip_public_ip" {
  value = "${aws_eip.fwb2_hamgmt_eip.public_ip}"
}

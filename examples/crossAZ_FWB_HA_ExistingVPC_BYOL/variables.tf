variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "Provide the region to use"
  default = "us-east-1"
}
variable "availability_zone1" {
  description = "Provide the availability zone to create resources in"
  default = "us-east-1a"
}
variable "availability_zone2" {
  description = "Provide the availability zone to create resources in"
  default = "us-east-1b"
}
variable "vpc_id" {
  description = "Provide ID for the VPC"
  default = "vpc-11111111111111111111"
}
variable "vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  default = "192.168.0.0/16"
}
variable "public_subnet1_id" {
  description = "Provide the ID for the public subnet"
  default = "subnet-1111111111111111111"
}
variable "private_subnet1_id" {
  description = "Provide the ID for the private subnet"
  default = "subnet-1111111111111111111"
}
variable "hasync_subnet1_id" {
  description = "Provide the ID for the hasync subnet"
  default = "subnet-1111111111111111111"
}
variable "hamgmt_subnet1_id" {
  description = "Provide the ID for the hamgmt subnet"
  default = "subnet-1111111111111111111"
}
variable "public_subnet2_id" {
  description = "Provide the ID for the public subnet"
  default = "subnet-1111111111111111111"
}
variable "private_subnet2_id" {
  description = "Provide the ID for the private subnet"
  default = "subnet-1111111111111111111"
}
variable "hasync_subnet2_id" {
  description = "Provide the ID for the hasync subnet"
  default = "subnet-1111111111111111111"
}
variable "hamgmt_subnet2_id" {
  description = "Provide the ID for the hamgmt subnet"
  default = "subnet-1111111111111111111"
}
variable "ami" {
  description = "Provide an AMI for the FortiGate instances"
  default = ""
}
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default = "c5.xlarge"
}
variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instance"
  default = "kp-poc-common"
}
variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default = "0.0.0.0/0"
}
variable "license_type" {
  description = "Provide the license type for the FortiGate instances, byol or ond"
  default = "byol"
}
variable "fwb1_byol_license" {
  description = "Provide the BYOL license filename for fwb1 and place the file in the root module folder"
  default = ""
}
variable "fwb2_byol_license" {
  description = "Provide the BYOL license filename for fwb2 and place the file in the root module folder"
  default = ""
}
variable "public_subnet1_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from public_subnet)"
  default = "192.168.1.1"
}
variable "private_subnet1_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from private_subnet)"
  default = "192.168.2.1"
}
variable "hamgmt_subnet1_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from hamgmt_subnet)"
  default = "192.168.4.1"
}
variable "public_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from public_subnet)"
  default = "192.168.11.1"
}
variable "private_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from private_subnet)"
  default = "192.168.12.1"
}
variable "hamgmt_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from hamgmt_subnet)"
  default = "192.168.14.1"
}
variable "tag_name_prefix" {
  description = "Provide a tag prefix value that that will be used in the name tag for all resources"
  default = "stack-1"
}
variable "fwb1_public_ip" {
  description = "Provide the IP address in CIDR form for the public interface of fwb1 (IP from public_subnet)"
  default = "192.168.1.11/24"
}
variable "fwb2_public_ip" {
  description = "Provide the IP address in CIDR form for the public interface of fwb2 (IP from public_subnet)"
  default = "192.168.11.12/24"
}

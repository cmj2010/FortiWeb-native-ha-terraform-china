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
variable "availability_zone3" {
  description = "Provide the availability zone to create resources in"
  default = "us-east-1c"
}
variable "vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  default = "192.168.0.0/16"
}
variable "public_subnet1_cidr" {
  description = "Provide the network CIDR for the public subnet"
  default = "192.168.1.0/24"
}

variable "public_subnet2_cidr" {
  description = "Provide the network CIDR for the public subnet"
  default = "192.168.11.0/24"
}

variable "public_subnet3_cidr" {
  description = "Provide the network CIDR for the public subnet"
  default = "192.168.111.0/24"
}

variable "ami" {
  description = "Provide an AMI for the FortiGate instances"
  default = ""
}
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default = "c5.large"
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
variable "public_subnet2_intrinsic_router_ip" {
  description = "Provide the IP address of the AWS intrinsic router (First IP from public_subnet)"
  default = "192.168.11.1"
}
variable "tag_name_prefix" {
  description = "Provide a tag prefix value that that will be used in the name tag for all resources"
  default = "stack-1"
}

variable "fwb1_public_ip" {
  default = "192.168.1.111"
}

variable "fwb2_public_ip" {
  default = "192.168.11.111"
}


variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "Provide the region to deploy the VPC in"
  default = "us-east-1"
}
variable "availability_zone1" {
  description = "Provide the availability zone to create the subnets in"
  default = "us-east-1a"
}
variable "availability_zone2" {
  description = "Provide the availability zone to create the subnets in"
  default = "us-east-1b"
}
variable "availability_zone3" {
  description = "Provide the availability zone to create the subnets in"
  default = "us-east-1c"
}
variable "vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  default = "192.168.0.0/16"
}
variable "public_subnet1_cidr" {
  description = "Provide the network CIDR for the public subnet1"
  default = "192.168.1.0/24"
}
variable "private_subnet1_cidr" {
  description = "Provide the network CIDR for the private subnet1"
  default = "192.168.2.0/24"
}
variable "public_subnet2_cidr" {
  description = "Provide the network CIDR for the public subnet2"
  default = "192.168.11.0/24"
}
variable "private_subnet2_cidr" {
  description = "Provide the network CIDR for the private subnet2"
  default = "192.168.12.0/24"
}
variable "public_subnet3_cidr" {
  description = "Provide the network CIDR for the public subnet3"
  default = "192.168.21.0/24"
}
variable "private_subnet3_cidr" {
  description = "Provide the network CIDR for the private subnet3"
  default = "192.168.22.0/24"
}
variable "tag_name_prefix" {
  description = "Provide a tag prefix value that that will be used in the name tag for all resources"
  default = "stack-1"
}
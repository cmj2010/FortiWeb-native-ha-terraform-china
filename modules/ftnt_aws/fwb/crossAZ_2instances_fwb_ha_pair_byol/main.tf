provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

resource "aws_iam_role" "iam-role" {
  name = "${var.tag_name_prefix}-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com.cn"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "${var.tag_name_prefix}-iam-instance-profile"
  role = "${var.tag_name_prefix}-iam-role"
}

resource "aws_iam_role_policy" "iam-role-policy" {
  name = "${var.tag_name_prefix}-iam-role-policy"
  role = aws_iam_role.iam-role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
		"ec2:Describe*",
		"ec2:AssociateAddress",
		"ec2:AssignPrivateIpAddresses",
		"ec2:UnassignPrivateIpAddresses",
		"ec2:ReplaceRoute",
    "s3:Get*",
    "s3:List*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_security_group" "secgrp" {
  name = "${var.tag_name_prefix}-secgrp"
  description = "secgrp"
  vpc_id = var.vpc_id
  ingress {
    description = "Allow remote access to FWB"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.cidr_for_access]
  }
  ingress {
    description = "Allow local VPC access to FWB"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.tag_name_prefix}-fwb-secgrp"
  }
}

resource "aws_network_interface" "fwb1_eni0" {
  subnet_id = var.public_subnet1_id
  security_groups = [ aws_security_group.secgrp.id ]
  private_ips = [var.fwb1_public_ip]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fwb1-eni0"
  }
}

resource "aws_eip" "fwb1_hamgmt_eip" {
  vpc = true
  network_interface = aws_network_interface.fwb1_eni0.id
  associate_with_private_ip = var.fwb1_public_ip
  tags = {
    Name = "${var.tag_name_prefix}-fwb1-hamgmt-eip"
  }
}

resource "aws_instance" "fwb1" {
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone1
  key_name = var.keypair
  iam_instance_profile = aws_iam_instance_profile.iam_instance_profile.id
  user_data = data.template_file.fwb1_userdata.rendered
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.fwb1_eni0.id
  }
  tags = {
	Name = "${var.tag_name_prefix}-fwb1"
  }
}

data "template_file" "fwb1_userdata" {
  template = "${file("${path.module}/fwb1-userdata.tpl")}"
  
  vars = {
    fwb1_public_ip = var.fwb1_public_ip
    fwb2_public_ip = var.fwb2_public_ip
    public_subnet1_intrinsic_router_ip = var.public_subnet1_intrinsic_router_ip
    fwb1_byol_license = "${file("${path.root}/${var.fwb1_byol_license}")}"
  }
}

resource "aws_network_interface" "fwb2_eni0" {
  subnet_id = var.public_subnet2_id
  security_groups = [ aws_security_group.secgrp.id ]
  private_ips = [var.fwb2_public_ip]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fwb2-eni0"
  }
}

resource "aws_eip" "fwb2_hamgmt_eip" {
  vpc = true
  network_interface = aws_network_interface.fwb2_eni0.id
  associate_with_private_ip = var.fwb2_public_ip
  tags = {
    Name = "${var.tag_name_prefix}-fwb2-hamgmt-eip"
  }
}

resource "aws_instance" "fwb2" {
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone2
  key_name = var.keypair
  iam_instance_profile = aws_iam_instance_profile.iam_instance_profile.id
  user_data = data.template_file.fwb2_userdata.rendered
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.fwb2_eni0.id
  }
  tags = {
	Name = "${var.tag_name_prefix}-fwb2"
  }
}

data "template_file" "fwb2_userdata" {
  template = "${file("${path.module}/fwb2-userdata.tpl")}"
  
  vars = {
    fwb2_public_ip = var.fwb2_public_ip
    fwb1_public_ip = var.fwb1_public_ip
    public_subnet2_intrinsic_router_ip = var.public_subnet2_intrinsic_router_ip
	  fwb2_byol_license = "${file("${path.root}/${var.fwb2_byol_license}")}"
  }
}
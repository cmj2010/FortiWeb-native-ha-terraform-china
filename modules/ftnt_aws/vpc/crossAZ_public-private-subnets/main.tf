resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.tag_name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.tag_name_prefix}-vpc"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-public-subnet1"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-private-subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-public-subnet2"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-private-subnet2"
  }
}

resource "aws_subnet" "public_subnet3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet3_cidr
  availability_zone = var.availability_zone3
  tags = {
    Name = "${var.tag_name_prefix}-public-subnet3"
  }
}

resource "aws_subnet" "private_subnet3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet3_cidr
  availability_zone = var.availability_zone3
  tags = {
    Name = "${var.tag_name_prefix}-private-subnet3"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.tag_name_prefix}-private-rt"
  }
}

resource "aws_route_table_association" "public_rt_association1" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "public_rt_association2" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association3" {
  subnet_id = aws_subnet.public_subnet3.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_association1" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association2" {
  subnet_id = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association3" {
  subnet_id = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.private_rt.id
}
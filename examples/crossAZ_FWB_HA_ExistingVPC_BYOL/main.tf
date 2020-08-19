provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

module "fwb-ha" {
  source = "./../../modules/ftnt_aws/fwb/crossAZ_2instances_fwb_ha_pair_byol"
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region

  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  vpc_id = var.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
  public_subnet1_id = var.vpc.public_subnet1_id
  public_subnet2_id = var.vpc.public_subnet2_id

  ami = var.license_type == "byol" ? lookup(var.fwb-byol-amis, var.region) : lookup(var.fwb-ond-amis, var.region)
  keypair = var.keypair  
  cidr_for_access = var.cidr_for_access
  instance_type = var.instance_type
  license_type = var.license_type
  fwb1_byol_license = var.fwb1_byol_license
  fwb2_byol_license = var.fwb2_byol_license
  public_subnet1_intrinsic_router_ip = var.public_subnet1_intrinsic_router_ip
  public_subnet2_intrinsic_router_ip = var.public_subnet2_intrinsic_router_ip
  tag_name_prefix = var.tag_name_prefix

  fwb1_public_ip = var.fwb1_public_ip
  fwb2_public_ip = var.fwb2_public_ip
}
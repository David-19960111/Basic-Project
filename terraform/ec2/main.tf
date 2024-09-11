provider "aws" {
  region = var.region
}

module "main" {
  source = "../modules/ec2"

  vpc_cidr = var.vpc_cidr
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  storage_size = var.storage_size
  associate_public_ip_address = var.associate_public_ip_address
  azs_public = var.azs_public
  azs_private = var.azs_private
  priv_sub_cidr_block = var.priv_sub_cidr_block
  public_sub_cidr_block = var.public_sub_cidr_block
}
module "ec2" {
  source = "./modules/ec2"

  vpc_cidr                    = var.vpc_cidr
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  storage_size                = var.storage_size
  associate_public_ip_address = var.associate_public_ip_address
  azs_public                  = var.azs_public
  azs_private                 = var.azs_private
  priv_sub_cidr_block         = var.priv_sub_cidr_block
  public_sub_cidr_block       = var.public_sub_cidr_block
}

module "ecr" {
  source = "./modules/ecr"

  mutability        = var.mutability
  ecr_repo_name_one = var.ecr_repo_name_one
  ecr_repo_name_two = var.ecr_repo_name_two
}

module "eks" {
  source = "./modules/eks"

  tag-eks-cluster-role = var.tag-eks-cluster-role
  tag-eks-cluster      = var.tag-eks-cluster
  tag-eks-node-group   = var.tag-eks-node-group
  tag-eks-node-role    = var.tag-eks-node-role
  public_subnet_id     = module.ec2.public_subnet_id
  private_subnet_id    = module.ec2.private_subnet_id
}

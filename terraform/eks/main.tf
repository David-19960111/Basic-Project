module "eks" {
  source = "../modules/eks"

  tag-eks-cluster-role = var.tag-eks-cluster-role
  tag-eks-cluster = var.tag-eks-cluster
  tag-eks-node-group = var.tag-eks-node-group
  tag-eks-node-role = var.tag-eks-node-role
  public_subnet_id     = module.ec2.public_subnet_id
  private_subnet_id    = module.ec2.private_subnet_id
}
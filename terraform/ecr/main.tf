module "ecr" {
  source = "../modules/ecr"

  mutability = var.mutability
  ecr_repo_name_one = var.ecr_repo_name_one
  ecr_repo_name_two = var.ecr_repo_name_two
}
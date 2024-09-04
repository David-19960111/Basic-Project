locals {
  mutability = var.mutability == true ? "MUTABLE" : "INMUTABLE"
}

resource "aws_ecr_repository" "frontend" {
  name                 = var.ecr_repo_name_one
  image_tag_mutability = local.mutability

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = "${var.ecr_repo_name_one}"
  }
}

resource "aws_ecr_repository" "backend" {
  name                 = var.ecr_repo_name_two
  image_tag_mutability = local.mutability

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = "${var.ecr_repo_name_two}"
  }
}
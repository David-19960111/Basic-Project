output "ecr_repo_url_one" {
  value = aws_ecr_repository.frontend.repository_url
}

output "ecr_repo_url_two" {
  value = aws_ecr_repository.backend.repository_url
}
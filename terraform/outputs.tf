output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.ec2.vpc_id
}

output "public_subnet_id" {
  description = "ID de la subred pública creada"
  value       = module.ec2.public_subnet_id
}

output "private_subnet_id" {
  description = "ID de la subred privada creada"
  value       = module.ec2.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID de la Internet Gateway creada"
  value       = module.ec2.internet_gateway_id
}

output "public_route_table_id" {
  description = "ID de la tabla de rutas pública creada"
  value       = module.ec2.public_route_table_id
}

output "instance_public_ip" {
  description = "IP pública de la instancia EC2 creada"
  value       = module.ec2.instance_public_ip
}

output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = module.ec2.instance_id
}

output "security_group_id" {
  description = "ID del Security Group creado"
  value       = module.ec2.security_group_id
}

output "ecr_repo_url_one" {
  value = module.ecr.ecr_repo_url_one
}

output "ecr_repo_url_two" {
  value = module.ecr.ecr_repo_url_two
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
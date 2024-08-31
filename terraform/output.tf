output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "ID de la subred pública creada"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "ID de la subred privada creada"
  value       = aws_subnet.private_subnet.id
}

output "internet_gateway_id" {
  description = "ID de la Internet Gateway creada"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID de la tabla de rutas pública creada"
  value       = aws_route_table.public.id
}

output "instance_public_ip" {
  description = "IP pública de la instancia EC2 creada"
  value       = aws_instance.my_instance.public_ip
}

output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = aws_instance.my_instance.id
}

output "security_group_id" {
  description = "ID del Security Group creado"
  value       = aws_security_group.my_sg.id
}

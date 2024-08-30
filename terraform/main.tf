resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "vpc-k8s"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_sub_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.azs_public
  tags = {
    Name = "subnet-public-k8s"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.priv_sub_cidr_block
  availability_zone       = var.azs_private
  tags = {
    Name = "private-subnet-k8s"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.my_vpc.id 
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_instance" "my_instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.public_subnet.id 
  associate_public_ip_address = var.associate_public_ip_address
  key_name             = var.key_name
  security_groups      = [aws_security_group.my_sg.id]
  user_data = file("/mnt/c/Users/User/OneDrive/Escritorio/Proyectos/Proyectos Basicos/K8s/install_tools.sh")
  tags = {
    Name = "my-instance"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "Security group for instance project"
  description = "This is security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "ssh_security_group"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http_security_group"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    description = "https_security_group"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
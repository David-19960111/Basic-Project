resource "aws_iam_policy" "full_access_policy" {
  name        = "full-access-policy"
  description = "IAM policy that allows full access to all resources"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "*",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "password_policy" {
  name        = "password-policy"
  description = "IAM policy for managing password change and getting account password policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "iam:ChangePassword"
        ],
        Resource = [
          "arn:aws:iam::*:user/k8sdocker"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "iam:GetAccountPasswordPolicy"
        ],
        Resource = "*"
      }
    ]
  })
}

#Rol
resource "aws_iam_role" "combined_role" {
  name = "combined-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "full_access_attachment" {
  role       = aws_iam_role.combined_role.name
  policy_arn = aws_iam_policy.full_access_policy.arn
}

resource "aws_iam_role_policy_attachment" "password_policy_attachment" {
  role       = aws_iam_role.combined_role.name
  policy_arn = aws_iam_policy.password_policy.arn
}

resource "aws_iam_instance_profile" "combined_instance_profile" {
  name = "combined-instance-profile"
  role = aws_iam_role.combined_role.name
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-k8s"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.vpc_cidr

  tags = {
    Name = "subnet-k8s"
  }
}

resource "aws_instance" "my_instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.main.id
  associate_public_ip_address = var.associate_public_ip_address
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.combined_instance_profile.name
  security_groups      = [aws_security_group.my_sg.id]
  user_data = file("/mnt/c/Users/User/OneDrive/Escritorio/Proyectos/Proyectos Basicos/K8s/install_tools.sh")
  tags = {
    Name = "my-instance"
  }

  root_block_device {
    volume_size = var.storage_size
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/mnt/c/Users/User/OneDrive/Escritorio/Proyectos/Proyectos Basicos/K8s/k8sdocker.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "/mnt/c/Users/User/OneDrive/Escritorio/Proyectos/Proyectos Basicos/K8s/k8sdocker.pem"
    destination = "/home/ec2-user/k8sdocker.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ec2-user/",
      "chmod 400 k8sdocker.pem",
    ]
    on_failure = fail
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
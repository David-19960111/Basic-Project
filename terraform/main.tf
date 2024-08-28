resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-k8s"
  }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.vpc_cidr

  tags = {
    Name = "subnet-k8s"
  }
}

resource "aws_instance" "my_instance" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.main.id 
  key_name = var.key_name
  security_groups = aws_security_group.my_sg.id
  user_data = ""
  tags = {
    Name = "my-instance"
  }
   connection {
        type        = "ssh"
        user        = "ec2-user"  
        private_key = file("C:/Users/User/OneDrive/Escritorio/Proyectos/Proyectos Basicos/K8s/k8sdocker.pem")  
        host        = self.public_ip
    }
    
    provisioner "file" {
        source = "C:/Users/User/OneDrive/Escritorio/Proyectos/Proyectos Basicos/K8s/k8sdocker.pem"
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
    description      = "ssh_security_group"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
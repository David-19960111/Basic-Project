region        = "us-east-2"
vpc_cidr      = "10.0.0.0/16"
ami           = "ami-085f9c64a9b75eed5"
instance_type = "t2.micro"
key_name      = "k8sdocker"
storage_size = 30
associate_public_ip_address = true
azs_private = "us-east-2b"
azs_public = "us-east-2a"
priv_sub_cidr_block = "10.0.1.0/24"
public_sub_cidr_block = "10.0.0.0/24" 
variable "region" {
  description = "Variable region aws"
  type        = string
  default     = false
}

variable "vpc_cidr" {
  description = "Variable CIDR for vpc"
  type        = string
  default     = false
}

variable "ami" {
  default = false 
  type = string
  description = "ami for instance"
}

variable "instance_type" {
  default = false
  type = string
  description = "type instance"
}

variable "key_name" {
  default = false
  type = string
  description = "key_name"
}
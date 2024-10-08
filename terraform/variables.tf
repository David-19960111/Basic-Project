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
  default     = false
  type        = string
  description = "ami for instance"
}

variable "instance_type" {
  default     = false
  type        = string
  description = "type instance"
}

variable "key_name" {
  default     = false
  type        = string
  description = "key_name"
}

variable "storage_size" {
  default     = null
  type        = number
}

variable "associate_public_ip_address" {
  default = null 
  type = bool
}

variable "azs_public" {
  default = false 
  type = string
}

variable "azs_private" {
  default = false
  type = string
}

variable "priv_sub_cidr_block" {
  default = false 
  type = string
}

variable "public_sub_cidr_block" {
  default = false
  type = string
}
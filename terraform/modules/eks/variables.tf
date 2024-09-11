variable "tag-eks-cluster-role" {
  type = string
  default = null
}

variable "tag-eks-cluster" {
  type = string
  default = null 
}

variable "tag-eks-node-role" {
  type = string
  default = null 
}

variable "tag-eks-node-group" {
  type = string
  default = null 
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}
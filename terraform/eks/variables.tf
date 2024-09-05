variable "eks_vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}

variable "eks_subnet_ids" {
  description = "IDs de las subredes para EKS"
  type        = list(string)
}

variable "eks_control_plane_subnet_ids" {
  description = "IDs de las subredes del control plane para EKS"
  type        = list(string)
}

variable "mutability" {
  type        = bool
  description = "Enables/disables mutability (ability to change image tag)"
  default     = false
}

variable "ecr_repo_name_one" {
  type = string
  default = false
}

variable "ecr_repo_name_two" {
  type = string
  default = false 
}
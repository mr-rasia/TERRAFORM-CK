variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH"
  type        = string
}

variable "tags" {
  description = "Tags applied to security group resources"
  type        = map(string)
}

variable "dev_region" {
  description = "AWS region for dev environment"
  type        = string
  default     = "ap-south-1"
}

variable "qa_region" {
  description = "AWS region for qa environment"
  type        = string
  default     = "ap-southeast-1"
}

variable "prod_region" {
  description = "AWS region for prod environment"
  type        = string
  default     = "ap-northeast-1"
}

variable "ssh_key_name" {
  description = "SSH key pair name for all environments"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    Project   = "simple-ec2-app"
    ManagedBy = "terraform"
  }
}

variable "dev_instance_type" {
  description = "EC2 instance type for dev"
  type        = string
  default     = "t3.micro"
}

variable "qa_instance_type" {
  description = "EC2 instance type for qa"
  type        = string
  default     = "t3.micro"
}

variable "prod_instance_type" {
  description = "EC2 instance type for prod"
  type        = string
  default     = "t3.small"
}

variable "deploy_dev" {
  description = "Deploy dev environment"
  type        = bool
  default     = true
}

variable "deploy_qa" {
  description = "Deploy qa environment"
  type        = bool
  default     = true
}

variable "deploy_prod" {
  description = "Deploy prod environment"
  type        = bool
  default     = true
}

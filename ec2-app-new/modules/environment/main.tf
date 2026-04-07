locals {
  user_data = var.user_data
}

module "vpc" {
  source = "../vpc"

  environment          = var.environment
  project              = var.project
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone
  tags                 = var.tags
}

module "security_group" {
  source = "../security_group"

  environment      = var.environment
  project          = var.project
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  tags             = var.tags

  providers = {
    aws = aws
  }
}

module "ec2" {
  source = "../ec2"

  environment       = var.environment
  project           = var.project
  instance_type     = var.instance_type
  key_name          = var.ssh_key_name
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  user_data         = local.user_data
  tags              = var.tags

  providers = {
    aws = aws
  }
}

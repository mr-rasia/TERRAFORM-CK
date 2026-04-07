locals {
  user_data = templatefile(
    "${path.module}/../scripts/user_data.sh.tpl",
    {
      html   = file("${path.module}/../app/index.html")
      app_py = file("${path.module}/../app/app.py")
    }
  )
}

# Dev Environment
module "dev" {
  count   = var.deploy_dev ? 1 : 0
  source  = "../modules/environment"
  providers = {
    aws = aws.dev
  }

  environment       = "dev"
  project           = "simple-ec2-app"
  ssh_key_name      = var.ssh_key_name
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  instance_type     = var.dev_instance_type
  vpc_cidr          = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  user_data         = local.user_data
  tags              = merge(var.common_tags, { Environment = "dev" })
}

# QA Environment
module "qa" {
  count   = var.deploy_qa ? 1 : 0
  source  = "../modules/environment"
  providers = {
    aws = aws.qa
  }

  environment       = "qa"
  project           = "simple-ec2-app"
  ssh_key_name      = var.ssh_key_name
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  instance_type     = var.qa_instance_type
  vpc_cidr          = "10.2.0.0/16"
  public_subnet_cidr = "10.2.1.0/24"
  availability_zone = "ap-southeast-1a"
  user_data         = local.user_data
  tags              = merge(var.common_tags, { Environment = "qa" })
}

# Prod Environment
module "prod" {
  count   = var.deploy_prod ? 1 : 0
  source  = "../modules/environment"
  providers = {
    aws = aws.prod
  }

  environment       = "prod"
  project           = "simple-ec2-app"
  ssh_key_name      = var.ssh_key_name
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  instance_type     = var.prod_instance_type
  vpc_cidr          = "10.1.0.0/16"
  public_subnet_cidr = "10.1.1.0/24"
  availability_zone = "ap-northeast-1a"
  user_data         = local.user_data
  tags              = merge(var.common_tags, { Environment = "prod" })
}

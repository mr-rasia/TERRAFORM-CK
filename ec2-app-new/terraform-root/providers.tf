terraform {
  required_version = ">= 1.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  alias  = "dev"
  region = var.dev_region
  default_tags {
    tags = merge(var.common_tags, { Environment = "dev" })
  }
}

provider "aws" {
  alias  = "qa"
  region = var.qa_region
  default_tags {
    tags = merge(var.common_tags, { Environment = "qa" })
  }
}

provider "aws" {
  alias  = "prod"
  region = var.prod_region
  default_tags {
    tags = merge(var.common_tags, { Environment = "prod" })
  }
}

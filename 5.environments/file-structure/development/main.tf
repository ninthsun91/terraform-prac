terraform {
  backend "s3" {
    profile        = "terraform"
    bucket         = "landing-tf-state"
    key            = "practice/managing-multiple-environments/development/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-2"
}

variable "db_pass" {
  description = "database password"
  type        = string
  sensitive   = true
}

locals {
  environment_name = "development"
}

module "donut" {
  source = "../../../4.modules/web-app"

  # Input Variables
  app_name         = "donut-1"
  environment_name = local.environment_name
  create_dns_zone  = false
  domain           = "donut.place"
  instance_type    = "t2.micro"
  bucket_prefix    = "landingdonut-tf-practice-${local.environment_name}"
  db_name          = "donut${local.environment_name}"
  db_user          = "donut"
  db_pass          = var.db_pass
}
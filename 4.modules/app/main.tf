terraform {
  backend "s3" {
    profile        = "terraform"
    bucket         = "landing-tf-state"
    key            = "practice/web-app/terraform.tfstate"
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
  region = "ap-northeast-2"
}

variable "db_pass_1" {
  description = "password for database #1"
  type        = string
  sensitive   = true
}

variable "db_pass_2" {
  description = "password for database #2"
  type        = string
  sensitive   = true
}

module "donut_production" {
  source = "../web-app"

  # Input Variables
  app_name         = "donut-1"
  environment_name = "production"
  create_dns_zone  = true
  domain           = "donut.place"
  instance_type    = "t2.small"
  bucket_prefix    = "landingdonut-tf-practice-1"
  db_name          = "donutprod"
  db_user          = "donut"
  db_pass          = var.db_pass_1
}

module "donut_development" {
  source = "../web-app"

  # Input Variables
  app_name         = "donut-1"
  environment_name = "dev"
  create_dns_zone  = false
  domain           = "donut.place"
  instance_type    = "t2.small"
  bucket_prefix    = "landingdonut-tf-practice-2"
  db_name          = "donutdev"
  db_user          = "donut"
  db_pass          = var.db_pass_2
}
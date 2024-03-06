terraform {
  backend "s3" {
    profile        = "terraform"
    bucket         = "landing-tf-state"
    key            = "practice/consul/terraform.tfstate"
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

module "consul" {
  source = "git@github.com:hashicorp/terraform-aws-consul.git"
}
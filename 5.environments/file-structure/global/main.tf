terraform {
  backend "s3" {
    profile        = "terraform"
    bucket         = "landing-tf-state"
    key            = "practice/managing-multiple-environments/global/terraform.tfstate"
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

# Route53 zone is shared across deployment environments
resource "aws_route53_zone" "primary" {
  name = "donut.place"
}
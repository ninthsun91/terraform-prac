terraform {

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

locals {
  extra_tag = "extra-tag"
}

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name     = var.instance_name
    ExtraTag = local.extra_tag
  }
}

resource "aws_db_instance" "terraform-prac-db" {
  allocated_storage    = 20
  storage_type         = "standard"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  db_name              = "donut"
  username             = var.db_user
  password             = var.db_pass
  skip_final_snapshot  = true
}
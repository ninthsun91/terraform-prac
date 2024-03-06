# Local Path
module "web-app" {
  source = "../web-app"
}

# Terraform Registry
module "consul" {
  source = "hashicorp/consul/aws"
  version = "0.1.0"
}

# GitHub HTTPS
module "example" {
  source = "github.com/hasicorp/example?ref=v1.2.0"
}

# GitHub SSH
module "example" {
  source = "git@github.com:hashicorp/example.git"
}

# Generic Git Repo
module "example" {
  source = "git::ssh://username@example.com/storage.git"
}
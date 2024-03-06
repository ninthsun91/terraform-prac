## General Variables

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "ap-northeast-2"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "donut"
}

variable "environment_name" {
  description = "Deployment environment (development | staging | production)"
  type        = string
  default     = "development"
}

## Route53 Variables

variable "create_dns_zone" {
  description = <<-EOD
    Create a new Route 53 zone for the domain. 
    If true, create a new route53 zone.
    If false, use an existing zone.
  EOD
  type        = bool
  default     = false
}

variable "domain" {
  description = "Domain name for website"
  type        = string
}

## EC2 Variables

variable "ami" {
  description = "AMI for ec2 instance - Ubuntu 22.04 LTS"
  type        = string
  default     = "ami-0382ac14e5f06eb95"
}

variable "instance_type" {
  description = "Instance type for ec2 instance"
  type        = string
  default     = "t2.micro"
}

## S3 Variables

variable "bucket_name" {
  description = "Name of S3 bucket"
  type        = string
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket objects"
  type        = string
}

## RDS Variables

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_user" {
  description = "Username for the RDS database"
  type        = string
}

variable "db_pass" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}
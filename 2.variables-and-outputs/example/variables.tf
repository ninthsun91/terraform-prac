variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

variable "ami" {
  description = "AMI to use for ec2 instance - Ubuntu 22.04 LTS"
  type        = string
  default     = "ami-0382ac14e5f06eb95"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_user" {
  description = "database username"
  type        = string
  default     = "donut"
}

variable "db_pass" {
  description = "database password"
  type        = string
  sensitive   = true
}
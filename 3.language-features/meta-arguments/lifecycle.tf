resource "aws_instance" "server" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  lifecycle {
    ## Prevent the instance from being terminated before creating a new one
    ## Helps with zero downtime deployments
    create_before_destroy = true
    
    ## Prevents Terraform from reverting changes set by elsewhere
    ## Some resources may have metadata modified by other system outside of Terraform
    ignore_changes = [
      tags
    ]

    ## Prevents the instance from being destroyed by destroy command
    prevent_destroy = true
  }
}
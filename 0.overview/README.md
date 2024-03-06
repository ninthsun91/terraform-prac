# Overview - basic command

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0382ac14e5f06eb95"
  instance_type = "t2.micro"
}
```

check docs for additional arguments

[Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance)

### `terraform init`

- console
    
    ```
    > terraform init
    
    Initializing the backend...
    
    Initializing provider plugins...
    - Finding hashicorp/aws versions matching "~> 5.0"...
    - Installing hashicorp/aws v5.39.1...
    - Installed hashicorp/aws v5.39.1 (signed by HashiCorp)
    
    Terraform has created a lock file .terraform.lock.hcl to record the provider
    selections it made above. Include this file in your version control repository
    so that Terraform can guarantee to make the same selections by default when
    you run "terraform init" in the future.
    
    Terraform has been successfully initialized!
    
    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.
    
    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```
    
- downloads the provider from registry
- with no other configuration specified, it will create the structure locally
- if modules are used, they are also downloaded under `.terraform`
    - module - bundle terraform code to reuse
- state file
    - state file - JSON file containing information about every resource and data object
    - contains some sensitive infos — database password, etc.
    - usually store remotely in object store such as S3.

### `terraform plan`

- console
    
    ```
    > terraform plan
    
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # aws_instance.example will be created
      + resource "aws_instance" "example" {
          + ami                                  = "ami-0382ac14e5f06eb95"
          + arn                                  = (known after apply)
          + associate_public_ip_address          = (known after apply)
          + availability_zone                    = (known after apply)
          + cpu_core_count                       = (known after apply)
          + cpu_threads_per_core                 = (known after apply)
          + disable_api_stop                     = (known after apply)
          + disable_api_termination              = (known after apply)
          + ebs_optimized                        = (known after apply)
          + get_password_data                    = false
          + host_id                              = (known after apply)
          + host_resource_group_arn              = (known after apply)
          + iam_instance_profile                 = (known after apply)
          + id                                   = (known after apply)
          + instance_initiated_shutdown_behavior = (known after apply)
          + instance_lifecycle                   = (known after apply)
          + instance_state                       = (known after apply)
          + instance_type                        = "t2.micro"
          + ipv6_address_count                   = (known after apply)
          + ipv6_addresses                       = (known after apply)
          + key_name                             = (known after apply)
          + monitoring                           = (known after apply)
          + outpost_arn                          = (known after apply)
          + password_data                        = (known after apply)
          + placement_group                      = (known after apply)
          + placement_partition_number           = (known after apply)
          + primary_network_interface_id         = (known after apply)
          + private_dns                          = (known after apply)
          + private_ip                           = (known after apply)
          + public_dns                           = (known after apply)
          + public_ip                            = (known after apply)
          + secondary_private_ips                = (known after apply)
          + security_groups                      = (known after apply)
          + source_dest_check                    = true
          + spot_instance_request_id             = (known after apply)
          + subnet_id                            = (known after apply)
          + tags_all                             = (known after apply)
          + tenancy                              = (known after apply)
          + user_data                            = (known after apply)
          + user_data_base64                     = (known after apply)
          + user_data_replace_on_change          = false
          + vpc_security_group_ids               = (known after apply)
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    
    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
    "terraform apply" now.
    ```
    
- compares desired state(config tf file) to actual state(terraform state)

### `terraform apply`

- console
    
    ```
    > terraform apply
    
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
      + create
    
    Terraform will perform the following actions:
    
      # aws_instance.example will be created
      + resource "aws_instance" "example" {
          + ami                                  = "ami-0382ac14e5f06eb95"
          + arn                                  = (known after apply)
          + associate_public_ip_address          = (known after apply)
          + availability_zone                    = (known after apply)
          + cpu_core_count                       = (known after apply)
          + cpu_threads_per_core                 = (known after apply)
          + disable_api_stop                     = (known after apply)
          + disable_api_termination              = (known after apply)
          + ebs_optimized                        = (known after apply)
          + get_password_data                    = false
          + host_id                              = (known after apply)
          + host_resource_group_arn              = (known after apply)
          + iam_instance_profile                 = (known after apply)
          + id                                   = (known after apply)
          + instance_initiated_shutdown_behavior = (known after apply)
          + instance_lifecycle                   = (known after apply)
          + instance_state                       = (known after apply)
          + instance_type                        = "t2.micro"
          + ipv6_address_count                   = (known after apply)
          + ipv6_addresses                       = (known after apply)
          + key_name                             = (known after apply)
          + monitoring                           = (known after apply)
          + outpost_arn                          = (known after apply)
          + password_data                        = (known after apply)
          + placement_group                      = (known after apply)
          + placement_partition_number           = (known after apply)
          + primary_network_interface_id         = (known after apply)
          + private_dns                          = (known after apply)
          + private_ip                           = (known after apply)
          + public_dns                           = (known after apply)
          + public_ip                            = (known after apply)
          + secondary_private_ips                = (known after apply)
          + security_groups                      = (known after apply)
          + source_dest_check                    = true
          + spot_instance_request_id             = (known after apply)
          + subnet_id                            = (known after apply)
          + tags_all                             = (known after apply)
          + tenancy                              = (known after apply)
          + user_data                            = (known after apply)
          + user_data_base64                     = (known after apply)
          + user_data_replace_on_change          = false
          + vpc_security_group_ids               = (known after apply)
        }
    
    Plan: 1 to add, 0 to change, 0 to destroy.
    
    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    aws_instance.example: Creating...
    aws_instance.example: Still creating... [10s elapsed]
    aws_instance.example: Still creating... [20s elapsed]
    aws_instance.example: Still creating... [30s elapsed]
    aws_instance.example: Creation complete after 32s [id=i-0a4e234bbe60ff348]
    
    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```
    
- applies configuration to actual aws service
- match actual state to desired state

### `terraform destroy`

- console
    
    ```
    > terraform destroy
    aws_instance.example: Refreshing state... [id=i-0a4e234bbe60ff348]
    
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
      - destroy
    
    Terraform will perform the following actions:
    
      # aws_instance.example will be destroyed
      - resource "aws_instance" "example" {
          - ami                                  = "ami-0382ac14e5f06eb95" -> null
          - arn                                  = "arn:aws:ec2:ap-northeast-2:448348283489:instance/i-0a4e234bbe60ff348" -> null
          - associate_public_ip_address          = true -> null
          - availability_zone                    = "ap-northeast-2c" -> null
          - cpu_core_count                       = 1 -> null
          - cpu_threads_per_core                 = 1 -> null
          - disable_api_stop                     = false -> null
          - disable_api_termination              = false -> null
          - ebs_optimized                        = false -> null
          - get_password_data                    = false -> null
          - hibernation                          = false -> null
          - id                                   = "i-0a4e234bbe60ff348" -> null
          - instance_initiated_shutdown_behavior = "stop" -> null
          - instance_state                       = "running" -> null
          - instance_type                        = "t2.micro" -> null
          - ipv6_address_count                   = 0 -> null
          - ipv6_addresses                       = [] -> null
          - monitoring                           = false -> null
          - placement_partition_number           = 0 -> null
          - primary_network_interface_id         = "eni-0f482ee0549ef3e15" -> null
          - private_dns                          = "ip-172-31-47-36.ap-northeast-2.compute.internal" -> null
          - private_ip                           = "172.31.47.36" -> null
          - public_dns                           = "ec2-43-200-163-238.ap-northeast-2.compute.amazonaws.com" -> null
          - public_ip                            = "43.200.163.238" -> null
          - secondary_private_ips                = [] -> null
          - security_groups                      = [
              - "default",
            ] -> null
          - source_dest_check                    = true -> null
          - subnet_id                            = "subnet-0d11bf22a51ca1a69" -> null
          - tags                                 = {} -> null
          - tags_all                             = {} -> null
          - tenancy                              = "default" -> null
          - user_data_replace_on_change          = false -> null
          - vpc_security_group_ids               = [
              - "sg-095c24808c932a371",
            ] -> null
    
          - capacity_reservation_specification {
              - capacity_reservation_preference = "open" -> null
            }
    
          - cpu_options {
              - core_count       = 1 -> null
              - threads_per_core = 1 -> null
            }
    
          - credit_specification {
              - cpu_credits = "standard" -> null
            }
    
          - enclave_options {
              - enabled = false -> null
            }
    
          - maintenance_options {
              - auto_recovery = "default" -> null
            }
    
          - metadata_options {
              - http_endpoint               = "enabled" -> null
              - http_protocol_ipv6          = "disabled" -> null
              - http_put_response_hop_limit = 1 -> null
              - http_tokens                 = "optional" -> null
              - instance_metadata_tags      = "disabled" -> null
            }
    
          - private_dns_name_options {
              - enable_resource_name_dns_a_record    = false -> null
              - enable_resource_name_dns_aaaa_record = false -> null
              - hostname_type                        = "ip-name" -> null
            }
    
          - root_block_device {
              - delete_on_termination = true -> null
              - device_name           = "/dev/sda1" -> null
              - encrypted             = false -> null
              - iops                  = 100 -> null
              - tags                  = {} -> null
              - tags_all              = {} -> null
              - throughput            = 0 -> null
              - volume_id             = "vol-09a681df8b865fe28" -> null
              - volume_size           = 8 -> null
              - volume_type           = "gp2" -> null
            }
        }
    
    Plan: 0 to add, 0 to change, 1 to destroy.
    
    Do you really want to destroy all resources?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.
    
      Enter a value: yes
    
    aws_instance.example: Destroying... [id=i-0a4e234bbe60ff348]
    aws_instance.example: Still destroying... [id=i-0a4e234bbe60ff348, 10s elapsed]
    aws_instance.example: Still destroying... [id=i-0a4e234bbe60ff348, 20s elapsed]
    aws_instance.example: Still destroying... [id=i-0a4e234bbe60ff348, 30s elapsed]
    aws_instance.example: Destruction complete after 40s
    
    Destroy complete! Resources: 1 destroyed.
    ```
    
- clean up relevant resources
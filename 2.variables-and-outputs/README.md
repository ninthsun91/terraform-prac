# Variables and Outputs

## Variable Types

### Input Variables

- `var.<name>`

```
variable "instance_type" {
	description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}
```

- input variable priority (lowest → highest)
    - manual entry during plan/apply
    (when value is set no where, terraform will prompt to set value during plan/apply)
    - default value in declaration block
    - `TF_VAR_<name>` environment variables
    - `terraform.tfvars` file
    - `*.auto.tfvars` file
    - command line `-var` or `-var-file`
        - `terraform apply -var="db_user=myuser" -var="db_pass=mypassword"`
        - `terraform apply -var-file="another-variable-file.tfvars"`

### Local Variables

- `local.<name>`
- but, declare in plural

```
locals {
  service_name = "My Service"
  owner        = "DevOps Directive"
}
```

### Output Variables

```
output "instance_ip_addr" {
  value = aws_instance.instance.public_ip
}
```

- to use specific value from terraform resources after creation

## Types & Validation

### Primitive Types

- string
- number
- bool

### Complex Types

- list(<TYPE>)
- set(<TYPE>)
- map(<TYPE>)
- object({ <KEY NAME> = <TYPE>, … })
- typle([ <TYPE>, … ])

### Validation

- type checking happens automatically
- custom conditon can also be enforced

## Seneitive Data

### `Sensitive` attribute

mark variables as sensitive

```
variable "instance_type" {
	description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
  sensitive   = true
}
```

### Pass to terraform apply with

- `TV_VAR_variable`
- `-var` to retrieve from secret manager (hashicorp vault, etc)

### external store

- AWS Secrets Manager
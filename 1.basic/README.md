# Remote Backend

## Terroform Cloud

```
terroform {
	backend "remote" {
		organization = "my-organization"

		workspaces {
			name = "my-workspace"
		}
	}
}
```

- free up to 5 users

## AWS

```
terraform {
	backend "s3" {
		bucket         = "my-terraform-state"
    key            = "terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
	}
}
```

- S3 - for actual state storage
- DynamoDB - to avoid multi-player conflict by locking state

## Bootstrapping

- create local backend, then move to remote backend

### Part 1 - create remote backend resources

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
  profile = "terraform"
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-state-bucket"
  force_destroy = true
  versioning {
    enabled     = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_defaul {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-state-locking"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
```

- init > plan > apply
- Fix deprecated s3 resources
    
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
    
    resource "aws_s3_bucket" "terraform_state" {
      bucket        = "landing-terraform-practice"
      force_destroy = true
    }
    
    resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
      bucket = aws_s3_bucket.terraform_state.id
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }
    
    resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
      bucket = aws_s3_bucket.terraform_state.id
      versioning_configuration {
        status = "Enabled"
      }
    }
    
    resource "aws_dynamodb_table" "terraform_locks" {
      name           = "terraform-state-locking"
      billing_mode   = "PAY_PER_REQUEST"
      hash_key       = "LockID"
      attribute {
        name = "LockID"
        type = "S"
      }
    }
    ```
    

### Part2 - specify remote backend

```
terraform {
  backend "s3" {
		profile        = "terraform"
    bucket         = "terraform-state-bucket"
    key            = "terraform.tfstate"
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

..snippet
```

- re-run
init > plan
locals {
  subnet_ids = toset([
    "subnet-0bb1c79de3EXAMPLE",
    "subnet-1a2b3c4d5EXAMPLE",
  ])
}

resource "aws_instance" "server" {
  for_each = local.subnet_ids

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = each.key

  tags = {
    Name = "server-${each.key}"
  }
}
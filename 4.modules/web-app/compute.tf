##
# EC2 Instances
##
resource "aws_instance" "terraform-prac1" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
                    #!/bin/bash
                    echo "Hello, World1" > index.html
                    python3 -m http.server 8080 &
                    EOF
}

resource "aws_instance" "terraform-prac2" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
                    #!/bin/bash
                    echo "Hello, World2" > index.html
                    python3 -m http.server 8080 &
                    EOF
}

##
# Security Group for EC2 instances
##

resource "aws_security_group" "instances" {
  name = "${var.app_name}-${var.environment_name}-instance-sg"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_iam_role" "example" {
  name = "example"
  assume_role_policy = "..."
}

resource "aws_iam_instance_profile" "example" {
  role = aws_iam_role.example.name
}

resource "aws_iam_role_policy" "example" {
  name = "example"
  role = aws_iam_role.example.name
  policy = jsonencode({
    "Statement": [{
      "Action": "s3:*",
      "Effect": "Allow",
    }],
  })
}

resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.example.name

  ## Trying to create instance before the IAM role is created will fail
  depends_on = [
    aws_iam_role_policy.example,
  ]
}
output "instance_1_ip_addr" {
  value = aws_instance.terraform-prac1.public_ip
}

output "instance_2_ip_addr" {
  value = aws_instance.terraform-prac2.public_ip
}

output "db_instance_addr" {
  value = aws_db_instance.terraform-prac-db.address
}
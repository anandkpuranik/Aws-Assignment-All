output "ec2-ip" {
  value = aws_instance.wb.public_ip
}
provider "aws" {
  profile = "default"
  region  = var.region
}

#resource "aws_instance" "example" {
 # ami           = var.amis[var.region]
 # instance_type = var.ec2_type
 # subnet_id     = var.subnet_id
 # vpc_security_group_ids = var.vpc_security_group_ids
 # associate_public_ip_address = true
#}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = var.amis[var.region]
   instance_type = var.ec2_type
   key_name = var.keypair_keyname
   subnet_id = var.subnet_id
   vpc_security_group_ids = var.vpc_security_group_ids
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"

# Save the public IP for testing
  provisioner "local-exec" {
    command = "echo ${aws_instance.wb.public_ip} > public-ip.txt"
  }

  connection {
    user        = "ubuntu"
    host        = "${self.public_ip}"
    private_key = "${file("~/Desktop/T_Sys/assessments/tsys-training-keypair.ppk")}"
  }

  provisioner "file" {
    source      = "."
    destination = "/home/ubuntu"
  }
}
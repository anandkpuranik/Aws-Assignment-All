variable "region" {
  default = "us-east-1"
}
variable "amis" {
  type = "map"
}
variable "ec2_type"{}
variable "subnet_id"{}
variable "vpc_security_group_ids" { type = list }
variable "keypair_keyname" {}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/Desktop/T_Sys/assessments/tsys-training-keypair.ppk"
}
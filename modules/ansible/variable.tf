variable "instance_type" {}
variable "ami" {}
variable "subnet_id" {}
variable "availability_zone" {}
variable "key_id" {}
variable "vpc_security_group_ids" {}
variable "iam_instance_profile" {}
variable "discovery" {
  default = "~/Scripts/discovery.sh"
}
variable "playbook" {
  default = "~/Scripts/MyPlaybook.yaml"
}
variable "key" {
  default = "~/Keypairs/ssh_keypair.pub"
}
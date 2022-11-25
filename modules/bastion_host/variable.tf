variable  "instance_type" {
  default = "t2.micro"
}

variable "key_name" {}

variable "pub_sn1" {}

variable "bastion_sg" {}

variable "ami_redhat" {}

variable "tag_name" {}

variable "key" {
  default = "~/Keypairs/UST-apC"
}

variable "ami" {
    default = "ami-017fecd1353bcc96e"
}

variable "subnet_id" {
    default = ""
}

variable "availability_zone" {
    default = "us-west-2a"
}

variable "instance_type_t2" {
    default = "t2.medium"
}
variable "associate_public_ip_address" {
  default = true
}
variable "sec_group_id" {
    default = ""
}
variable "key_name" {
  default = ""
}

variable "keypair" {
  default = "~/Keypairs/UST-apC"
}
variable "tag_name" {
  default = ""
}
variable "region" {
  default = "us-west-2"
}

variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "VPC_CIDRPUB1" {
  default = "10.0.0.0/24"
}

variable "VPC_CIDRPUB2" {
  default = "10.0.1.0/24"
}



variable "VPC_CIDRPRIV1" {
  default = "10.0.2.0/24"
}

variable "VPC_CIDRPRIV2" {
  default = "10.0.3.0/24"
}


variable "AZ2" {
  default = "us-west-2b"
}

variable "AZ1" {
  default = "us-west-2a"
}


variable "all_cidr" {
  default = "0.0.0.0/0"
}

variable "vpc_name" {
  default = "PAADUS2_VPC"
}

variable "pubsn1_name" {
  default = "PAADUS2_PUSN1"
}

variable "pubsn2_name" {
  default = "PAADUS2_PUSN2"
}


variable "privsn1_name" {
  default = "PAADUS2_PRSN1"
}

variable "privsn2_name" {
  default = "PAADUS2_PRSN2"
}

variable "igw_name" {
  default = "PAADUS2_IGW"
}

variable "eip_name" {
  default = "PAADUS2_EIP"
}

variable "pubrt_name" {
  default = "PAADUS2_PUBRT"
}

variable "privrt_name" {
  default = "PAADUS2_PRIVRT"
}

variable "ng_name" {
  default = "PAADUS2_NATGW"
}
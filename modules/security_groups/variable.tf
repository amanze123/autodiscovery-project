variable "sgname1" {
  default = "BASTION_SG"
}
variable "VPC_ID" {
  default = ""
}
variable "all_cidr" {
  default = "0.0.0.0/0"
}
variable "sgname2" {
  default = "SONAR_SG"
}

variable "sgname3" {
  default = "JENKINS_SG"
}

variable "sgname4" {
  default = "DOCKER_SG"
}

variable "sgname5" {
  default = "RDS_SG"
}

variable "priv_cidr" {
  default = ["10.0.2.0/24","10.0.3.0/24"]
}
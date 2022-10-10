# RDS-SG Variables
variable "my_system" {
    default = ["0.0.0.0/0"]
    description = "this cidr block is open to the world"
}

variable "port_ssh" {
  default     = 22
  description = "this port allows ssh access"
}

variable "port_http" {
  default     = 80
  description = "this port allows http access"
}

variable "custom_port" {
  default     = 8080
  description = "this port allows jenkins access"
}

variable "custom2_port" {
  default     = 9000
  description = "this port allows sonarqube access"
}

variable "port_mysql" {
  default     = 3306
}

variable "sg_name" {}
variable "sg_name1" {}
variable "vpc_id" {}
variable "sg_name2" {}
variable "sg_name3" {}
variable "sg_name4" {}
variable "sg_name5" {}
variable "sg_name6" {}
variable "sg_name7" {}
variable "ami_redhat" {}
variable "instance_type" {}
variable "priv_sn2" {}
variable "ansible_sg" {}
variable "key_name" {}
variable "tag_name" {}
variable "iam_ans_inst_prof" {}
variable "autodiscovery" {
  default = "~/Scripts/discovery.txt"
}
variable "myplaybook" {
  default = "~/Scripts/MyPlaybook.txt"
}
variable "key" {
  default = "~/Keypairs/UST-apC"
}
  
  
  


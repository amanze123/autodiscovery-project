provider "aws" {
  region                   = "us-west-2"
}

module "dev_vpc" {
  source = "../../modules/vpc"
}

module "dev_security_group" {
  source = "../../modules/security_groups"
  VPC_ID = module.dev_vpc.VPC_ID
}

module "dev_key_pair" {
  source = "../../modules/key_pair"
  key_path = TF_VAR_
}

module "dev_docker_server" {
  source        = "../../modules/docker"
  ami_redhat    = "ami-08970fb2e5767e3b8"
  instance_type = "t2.medium"
  priv_sn1      = module.dev_vpc.PRSN1_ID
  docker_sg     = module.dev_security_group.DSG_ID
  key_name      = module.dev_key_pair.key-name
  tag_name      = "docker_instance"
}

module "dev_ansible_server" {
  source            = "../../modules/ansible"
  ami_redhat        = "ami-08970fb2e5767e3b8"
  instance_type     = "t2.micro"
  iam_ans_inst_prof = module.dev_iam_role.Instance_prof
  priv_sn2          = module.dev_vpc.PRSN2_ID
  ansible_sg        = module.dev_security_group.BSG_ID
  key_name          = module.dev_key_pair.key-name
  tag_name          = "ansible_instance"
}
module "dev_sonar" {
  source       = "../../modules/sonar_host"
  subnet_id    = module.dev_vpc.PUBSN1_ID
  sec_group_id = module.dev_security_group.SSG_ID
  key_name     = module.dev_key_pair.key-name
  tag_name     = "sonarqube_host"
}
module "dev_jenkins_server" {
  source        = "../../modules/jenkins"
  ami-redhat    = "ami-08970fb2e5767e3b8"
  instance_type = "t2.medium"
  priv_sn1      = module.dev_vpc.PRSN1_ID
  jenkins_sg    = module.dev_security_group.JSG_ID
  key_name      = module.dev_key_pair.key-name
  tag_name      = "jenkins_server"
}
module "dev_bastion_host" {
  source        = "../../modules/bastion_host"
  ami_redhat    = "ami-08970fb2e5767e3b8"
  instance_type = "t2.micro"
  pub_sn1       = module.dev_vpc.PUBSN1_ID
  bastion_sg    = module.dev_security_group.BSG_ID
  key_name      = module.dev_key_pair.key-name
  tag_name      = "bastion_host"
}
module "dev_iam_role" {
  source = "../../modules/iam_role"
}

module "dev_rds" {
  source     = "../../modules/multi_az"
  subnet_ids = [module.dev_vpc.PRSN1_ID, module.dev_vpc.PRSN2_ID]
  RDS_SG     = module.dev_security_group.RDS_ID
}

module "dev_high_avail" {
  source            = "../../modules/high_availability"
  asg-name          = "ust2-asg"
  asg-pol-name      = "ust2-asg-pol"
  target_group_arns = module.dev_loadbalancer.loadbalance_tg_arn
  instance_type     = "t2.medium"
  subnets           = [module.dev_vpc.PRSN1_ID, module.dev_vpc.PRSN2_ID]
  key_name          = module.dev_key_pair.key-id
  instance_id       = module.dev_docker_server.docker_id
  security_groups   = module.dev_security_group.DSG_ID
  depends_on = [
    time_sleep.wait_600_seconds
  ]
}

resource "time_sleep" "wait_600_seconds" {
  depends_on = [module.dev_docker_server]

  create_duration = "600s"
}

module "dev_loadbalancer" {
  source          = "../../modules/loadbalancer"
  priv_sn1        = [module.dev_vpc.PUBSN1_ID, module.dev_vpc.PUBSN2_ID]
  priv_sn2        = [module.dev_vpc.PUBSN1_ID, module.dev_vpc.PUBSN2_ID]
  jenkins_sg      = module.dev_security_group.JSG_ID
  docker_tg_name  = "UST2-TG"
  jenkins-lb-name = "UST2-Jenkins-lb"
  jenkins_server  = module.dev_jenkins_server.jenkins_id
  docker_sg       = module.dev_security_group.DSG_ID
  docker-lb-name  = "UST2-Docker-lb"
  vpc_id          = module.dev_vpc.VPC_ID
}

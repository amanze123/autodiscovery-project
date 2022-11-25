resource "aws_instance" "Bastion_host" {
  ami                         = var.ami_redhat
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.pub_sn1
  vpc_security_group_ids      = [var.bastion_sg]
  associate_public_ip_address = true
  user_data                   = <<-EOF
  #!/bin/bash     
  echo "${file(var.key)}" >> /home/ec2-user/UST-apC
  chmod 400 UST-apC
  sudo hostnamectl set-hostname Bastion 
  EOF
    tags = {
        name = var.tag_name
    }
}
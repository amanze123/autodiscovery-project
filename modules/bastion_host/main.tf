# Create a Bastion_Host
resource "aws_instance" "bastion_host" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  availability_zone           = var.availability_zone
  key_name                    = var.key_id
  associate_public_ip_address = true
  provisioner "file" {
    source = "~/Keypairs/ssh_keypair"
    destination = "/home/ec2-user/ssh_keypair"
  }
  connection {
    type = "ssh"
    host = self.public_ip
    private_key = file("~/Keypairs/ssh_keypair")
    user = "ec2-user"
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo chmod 400 USTeam1Keypair
  sudo hostnamectl set-hostname bastion
  EOF
  tags = {
    Name = "bastion_host"
  }
}
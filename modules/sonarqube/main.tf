resource "aws_instance" "Sonarqube" {
  ami                         = var.ami_ubuntu
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  user_data                   = file("C:/Users/Amanze Emeka/Scripts/sonarqube.sh")
  tags = {
    Name = "Sonarqube_Server"
  }
}
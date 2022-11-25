# Create Docker Server
resource "aws_instance" "docker_server" {
  ami                         = var.ami_redhat
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.docker_sg]
  subnet_id                   = var.priv_sn1
  key_name                    = var.key_name
  user_data                   = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
echo Admin123@ | passwd ec2-user --stdin
echo "ec2-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo bash -c ' echo "StrictHostKeyChecking No" >> /etc/ssh/ssh_config'
sed -ie 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd reload
echo "license_key: fbf50d8307cef908acf2a16f0e73317ccf92NRAL" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum install newrelic-infra -y
sudo usermod -aG docker ec2-user
sudo hostnamectl set-hostname Docker
EOF
  tags = {
    Name = var.tag_name
  }
}

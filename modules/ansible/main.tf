# Create Ansible Server
resource "aws_instance" "Ansible_Server" {
  ami                         = var.ami_redhat
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.ansible_sg]
  subnet_id                   = var.priv_sn2
  iam_instance_profile        = var.iam_ans_inst_prof
  key_name                    = var.key_name
  user_data                   = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo yum install python3.8 -y
sudo alternatives --set python /usr/bin/python3.8
sudo yum -y install python3-pip
sudo yum install ansible -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo yum install unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
sudo ln -svf /usr/local/bin/aws /usr/bin/aws
echo "${file(var.autodiscovery)}" >> /etc/ansible/discovery.sh
echo "${file(var.myplaybook)}" >> /etc/ansible/MyPlaybook.yaml
echo "${file(var.key)}" >> /etc/ansible/key.pem
sudo chown -R ec2-user:ec2-user /etc/ansible
sudo chmod 400 /etc/ansible/key.pem
sudo chmod 755 /etc/ansible/discovery.sh
aws configure set default.region us-west-2
aws configure set default.output text
echo "license_key: fbf50d8307cef908acf2a16f0e73317ccf92NRAL" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum install newrelic-infra -y
sudo hostnamectl set-hostname Ansible

EOF
  tags = {
    Name = var.tag_name
  }
}


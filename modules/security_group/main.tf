# Create Jenkins Security Group
resource "aws_security_group" "JenkinsSG" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  ingress {
    description = "Allow http from VPC"
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  ingress {
    description = "jenkins port from VPC"
    from_port   = var.custom_port
    to_port     = var.custom_port
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.my_system
  }

  tags = {
    Name = var.sg_name
  }
} 

# Create Bastion Security Group
resource "aws_security_group" "BastionSG" {
  name        = var.sg_name1
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.my_system
  }

  tags = {
    Name = var.sg_name1
  }
} 


# Create Docker_host Security Group
resource "aws_security_group" "DockerSG" {
  name        = var.sg_name2
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  ingress {
    description = "Allow custom_http from VPC"
    from_port   = var.custom_port
    to_port     = var.custom_port
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  ingress {
    description = "Allow http from VPC"
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.my_system
  }
  tags = {
    Name = var.sg_name2
  }
} 

# RDS Security group = RDS-SG
resource "aws_security_group" "rdsSG" {
  name        = var.sg_name3
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = var.port_mysql
    to_port     = var.port_mysql
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.my_system
  }

  tags = {
    Name = var.sg_name3
  }
} 

# Create Ansible Security Group
resource "aws_security_group" "AnsibleSG" {
  name        = var.sg_name4
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.my_system
  }

  tags = {
    Name = var.sg_name4
  }
}

# Create loadbalancer Security Group
resource "aws_security_group" "docker_lbSG" {
  name        = var.sg_name5
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

    ingress {
    description = "Allow http from VPC"
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.my_system
  }
  tags = {
    Name = var.sg_name5
  }
} 

# Create Jenkins classic loadbalancer Security Group
resource "aws_security_group" "jenkins_elbSG" {
  name        = var.sg_name6
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

    ingress {
    description = "Allow http from VPC"
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.my_system
  }
  tags = {
    Name = var.sg_name6
  }
} 
# Create Sonarqube Security Group
resource "aws_security_group" "SonarqubeSG" {
  name        = var.sg_name7
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  ingress {
    description = "sonarqube port from VPC"
    from_port   = var.custom2_port
    to_port     = var.custom2_port
    protocol    = "tcp"
    cidr_blocks = var.my_system
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.my_system
  }

  tags = {
    Name = var.sg_name7
  }
}
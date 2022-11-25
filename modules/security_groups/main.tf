#CREATE SECURITY GROUPS
#SECURITY GROUP FOR THE BASTION HOST
resource "aws_security_group" "PAADUS2_BASTION_SG" {
  name        =  var.sgname1
  description = "Allow TLS Inbound"
  vpc_id      = var.VPC_ID


  ingress {
    description = "allow ssh acess"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }

  tags = {
    name =  var.sgname1
  }
}

#SECURITY GROUP FOR THE SONARQUBE
resource "aws_security_group" "PAADUS2_SONAR_SG" {
  name        =  var.sgname2
  description = "Allow TLS Inbound"
  vpc_id      = var.VPC_ID


  ingress {
    description = "allow ssh acess"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

ingress {
    description = "allow ssh acess"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }

  tags = {
    name =  var.sgname2
  }
}
#SECURITY GROUP FOR THE JENKINS
resource "aws_security_group" "PAADUS2_JENKINS_SG" {
  name        =  var.sgname3
  description = "Allow TLS Inbound"
  vpc_id      = var.VPC_ID


  ingress {
    description = "allow ssh acess"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

ingress {
    description = "allow jenkins port acess"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

  ingress {
    description = "allow lb  acess"
    from_port   = 80  
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }

  tags = {
    name =  var.sgname3
  }
}

#SECURITY GROUP FOR THE DOCKER HOST
resource "aws_security_group" "PAADUS2_DOCKER_SG" {
  name        =  var.sgname4
  description = "Allow TLS Inbound"
  vpc_id      = var.VPC_ID


  ingress {
    description = "allow ssh acess"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

ingress {
    description = "allow docker port  acess"
    from_port   = 8085
    to_port     = 8085
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }

  ingress {
    description = "allow lb  port acess"
    from_port   = 80  
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }

  tags = {
    name =  var.sgname4
  }
}
# SECURITY GROUP FOR RDS
resource "aws_security_group" "PAADUS2_RDS_SG" {
  name        =  var.sgname5
  description = "Allow TLS Inbound"
  vpc_id      = var.VPC_ID

  ingress {
    description = "allow ssh acess"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.priv_cidr
  }

  ingress {
    description = "allow ssh acess"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.priv_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }

  tags = {
    name =  var.sgname5
  }
}


# Create a multi AZ RDS database
# DB subnet group = "aws_subnet" "PAADUS2_SNG"
resource "aws_db_subnet_group" "UST2_DB_SNG" {
  name       = var.db_name
  subnet_ids = var.subnet_ids
  tags = {
    Name = var.db_name
  }
}

# RDS database =DB
resource "aws_db_instance" "UST2_DB" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  multi_az               = true
  db_name                = var.database_name
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.UST2_DB_SNG.id
  vpc_security_group_ids = [var.RDS_SG]
}
 
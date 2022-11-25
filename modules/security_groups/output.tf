output "BSG_ID" {
  value = aws_security_group.PAADUS2_BASTION_SG.id
}

output "SSG_ID" {
  value = aws_security_group.PAADUS2_SONAR_SG.id
}

output "DSG_ID" {
  value = aws_security_group.PAADUS2_DOCKER_SG.id
}

output "JSG_ID" {
  value = aws_security_group.PAADUS2_JENKINS_SG.id
}

output "RDS_ID" {
  value = aws_security_group.PAADUS2_RDS_SG.id
}
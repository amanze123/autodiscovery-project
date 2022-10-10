output "Sonarqube_IP" {
  value       = aws_instance.Sonarqube.public_ip
  description = "Sonarqube public IP"
}

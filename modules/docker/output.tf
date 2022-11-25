output "docker_priv_IP" {
  value = aws_instance.docker_server.private_ip
}

output "docker_id" {
  value = aws_instance.docker_server.id
}
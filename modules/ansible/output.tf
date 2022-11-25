output "ansible_priv_ip" {
  value = aws_instance.Ansible_Server.private_ip
}

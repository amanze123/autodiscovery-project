output "Bastion_host_ip" {
value = aws_instance.Bastion_host.public_ip 
}
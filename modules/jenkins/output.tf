output "jenkins_priv_ip" {
    value = aws_instance.Jenkins_Server.private_ip
}
output "jenkins_id" {
    value = aws_instance.Jenkins_Server.id
}
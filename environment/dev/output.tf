output "docker_priv_ip" {
  value = module.dev_docker_server.docker_priv_IP
}
output "SONAR_IP" {
  value = module.dev_sonar.SONAR_IP
}
output "ansible_priv_ip" {
  value = module.dev_ansible_server.ansible_priv_ip
}
output "bastion_pub_ip" {
  value = module.dev_bastion_host.Bastion_host_ip
}
output "jenkins_priv_ip" {
  value = module.dev_jenkins_server.jenkins_priv_ip
}
output "rds-endpoint" {
  value = module.dev_rds.db_endpoint
}
output "docker-lb" {
  value = module.dev_loadbalancer.loadbalance_dns
}
output "jenkins-lb" {
  value = module.dev_loadbalancer.Jenkins_loadbalance_dns
}
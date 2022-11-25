output "loadbalance_dns" {
  value = aws_lb.Docker-lb.dns_name
}

output "loadbalance_zone_id" {
  value = aws_lb.Docker-lb.zone_id
}

output "loadbalance_tg_arn" {
  value = aws_lb_target_group.docker_tg.arn
}

output "Jenkins_loadbalance_dns" {
  value = aws_elb.jenkins-lb.dns_name
}
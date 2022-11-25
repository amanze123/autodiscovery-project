
#create AMI from instance
resource "aws_ami_from_instance" "UST2-AMI" {
  name               = "UST2-AMI"
  source_instance_id = var.instance_id
}

#Create launch configuration
resource "aws_launch_configuration" "paapust2-lc" {
  name                        = "paapust2-lc"
  image_id                    = aws_ami_from_instance.UST2-AMI.id
  instance_type               = var.instance_type
  security_groups             = [var.security_groups]
  key_name                    = var.key_name
}

# Create Autoscaling group
resource "aws_autoscaling_group" "paapust2-asg" {
  name                      = var.asg-name
  desired_capacity          = 3
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.paapust2-lc.name
  vpc_zone_identifier       = var.subnets
  target_group_arns         = [var.target_group_arns]
  tag {
    key                 = "Name"
    value               = "paapust2-asg"
    propagate_at_launch = true
  }
}

# create Autoscaling group policy
resource "aws_autoscaling_policy" "paapust2-asg-pol" {
  name                   = var.asg-pol-name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.paapust2-asg.name
}
resource "aws_autoscaling_group" "demo2-ecs-autoscaling-grp" {
  max_size = 2
  min_size = 1
  name = "demo2-ecs-autoscaling-grp"
  launch_configuration = aws_launch_configuration.demo2-ecs-launch-config.name
  vpc_zone_identifier = [aws_subnet.demo2-PubSN-1.id]
  health_check_grace_period = 300
  health_check_type = "EC2"
}
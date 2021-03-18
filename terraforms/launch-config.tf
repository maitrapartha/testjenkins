resource "aws_launch_configuration" "demo2-ecs-launch-config" {
  image_id = "ami-094d4d00fd7462815"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.demo2-public-security-group.id]
  iam_instance_profile = aws_iam_instance_profile.demo2-ecs-instance-profile.id
  associate_public_ip_address = true
  user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=Demo2-ECS-Cluster >> /etc/ecs/ecs.config
                                  EOF
}
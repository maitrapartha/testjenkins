resource "aws_launch_configuration" "demo2-ecs-launch-config" {
  image_id = "ami-0ec7896dee795dfa9"
  ## this image is an ECS optimized one - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
  instance_type = "t2.micro"
  security_groups = [aws_security_group.demo2-public-security-group.id]
  iam_instance_profile = aws_iam_instance_profile.demo2-ecs-instance-profile.id
  associate_public_ip_address = true
  user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=Demo2-ECS-Cluster >> /etc/ecs/ecs.config
                                  EOF
}
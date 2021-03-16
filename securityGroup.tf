resource "aws_security_group" "ecs_security_group" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "tcp"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

data "aws_iam_policy_document" "ecs_agent"{
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }
  }
}
resource "aws_iam_role" "ecs_agent" {
  assume_role_policy = data.aws_iam_policy_document.ecs_agent.json
  name = "ecs-agent"
}
resource "aws_iam_role_policy_attachment" "ecs_agent" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role = aws_iam_role.ecs_agent.name
}
resource "aws_iam_instance_profile" "ecs_agent" {
  name = "ecs-agent"
  role = aws_iam_role.ecs_agent.name
}
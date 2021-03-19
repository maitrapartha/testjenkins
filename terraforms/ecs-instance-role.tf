data "aws_iam_policy_document" "demo2-ecs-instance-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "demo2-ecs-instance-role" {
  assume_role_policy = data.aws_iam_policy_document.demo2-ecs-instance-policy.json
  name = "demo2-ecs-instance-role"
  path = "/"
}

resource "aws_iam_role_policy_attachment" "demo2-ecs-instance-role-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role = aws_iam_role.demo2-ecs-instance-role.name
}

resource "aws_iam_instance_profile" "demo2-ecs-instance-profile" {
  name = "demo2-ecs-instance-profile"
  path = "/"
  role = aws_iam_role.demo2-ecs-instance-role.name
}
data "aws_iam_policy_document" "demo2-ecs-service-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ecs.amazonaws.com"]
      type = "Service"
    }
  }
}

resource "aws_iam_role" "demo2-ecs-service-role" {
  name = "demo2-ecs-service-role"
  assume_role_policy = data.aws_iam_policy_document.demo2-ecs-service-policy.json
  path = "/"
}

resource "aws_iam_role_policy_attachment" "demo2-ecs-role-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
  role = aws_iam_role.demo2-ecs-service-role.name
}

resource "aws_iam_instance_profile" "demo2-ecs-service-profile" {
  name = "demo2-ecs-service-profile"
  path = "/"
  role = aws_iam_role.demo2-ecs-service-role.name
}
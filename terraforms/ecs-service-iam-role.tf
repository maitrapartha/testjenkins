/*data "aws_iam_policy_document" "demo2-ecs-service-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ecs.amazonaws.com"]
      type = "Service"
    }
    effect = "Allow"
  }
}*/

resource "aws_iam_role" "demo2-ecs-service-role" {
  name = "demo2-ecs-service-role"
  assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
		"Effect": "Allow",
		"Principal": {
			"Service": "ec2.amazonaws.com"
		},
		"Action": "sts:AssumeRole",
        "Sid": ""
	}, {
		"Effect": "Allow",
		"Principal": {
			"Service": "ecs.amazonaws.com"
		},
		"Action": "sts:AssumeRole",
        "Sid": ""
	}, {
		"Effect": "Allow",
		"Principal": {
			"Service": "ecs-tasks.amazonaws.com"
		},
		"Action": "sts:AssumeRole",
        "Sid": ""
	}
  ]
}
EOF
}

/*resource "aws_iam_role" "demo2-ecs-service-role" {
  name = "demo2-ecs-service-role"
  assume_role_policy = data.aws_iam_policy_document.demo2-ecs-service-policy.json
  path = "/"
}*/

resource "aws_iam_role_policy_attachment" "demo2-ecs-role-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role = aws_iam_role.demo2-ecs-service-role.name
}

resource "aws_iam_instance_profile" "demo2-ecs-service-profile" {
  name = "demo2-ecs-service-profile"
  path = "/"
  role = aws_iam_role.demo2-ecs-service-role.name
}
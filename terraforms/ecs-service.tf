resource "aws_ecs_service" "demo2-ecs-service" {
  name = "demo2-ecs-service"
  #iam_role = aws_iam_role.demo2-ecs-service-role.name

  cluster = aws_ecs_cluster.demo2-ecs-cluster.id
  task_definition = aws_ecs_task_definition.demo2_task_definition.family
  desired_count = 2

  load_balancer {
    container_name = "demo2-first-task"
    container_port = 8080
    target_group_arn = aws_alb_target_group.demo2-ecs-alb-target-grp.arn
  }
}
resource "aws_ecs_service" "partham" {
  name = "partham"
  cluster = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_defination.arn
  desired_count = 2
}
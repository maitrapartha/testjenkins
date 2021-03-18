resource "aws_ecs_task_definition" "task_defination" {
  container_definitions = data.template_file.task_defination_template.rendered
  family = "partham"
}
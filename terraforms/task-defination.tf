data "template_file" "web-service-task-template" {
  template = file("web-service-task.json.tpl")
  vars = {
    REPOSITORY_URL = replace(aws_ecr_repository.demo2-web-service-repo.name, "https://", "")
  }
}

resource "aws_ecs_task_definition" "demo2_task_definition" {
  container_definitions = data.template_file.web-service-task-template.rendered
  #container_definitions = file("web-service-task.json")
  family = "web-service-01"
}
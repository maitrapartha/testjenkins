data "template_file" "task_defination_template" {
  template = file("task_defination.json.tpl")
  vars = {
    REPOSITORY_URL = replace(aws_ecr_repository.partham.repository_url,"https://" , "")
  }
}
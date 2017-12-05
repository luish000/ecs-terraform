variable "container_definitions" {}

resource "aws_ecs_task_definition" "td" {
  family = "api"
  container_definitions = "${var.container_definitions}"
}

output arn { value = "${aws_ecs_task_definition.td.arn}" }

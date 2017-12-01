resource "aws_ecs_task_definition" "api" {
  family = "api"
  container_definitions = "${file("${path.module}/api/api.json")}"
}

output apiTaskDef { value = "${aws_ecs_task_definition.api.arn}" }

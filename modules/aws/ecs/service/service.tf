variable "cluster" {}
variable "iam_role" {}
variable "task_definition" {}
variable "desired_count" {}
variable "tg" {}
variable "container_name" {}
variable "container_port" {}
variable "name" {}

resource "aws_ecs_service" "service" {
  name = "${var.name}"
  iam_role = "${var.iam_role}"
  cluster = "${var.cluster}"
  task_definition = "${var.task_definition}"
  desired_count = "${var.desired_count}"

  load_balancer {
    target_group_arn = "${var.tg}"
    container_port = "${var.container_port}"
    container_name = "${var.container_name}"
	}

}

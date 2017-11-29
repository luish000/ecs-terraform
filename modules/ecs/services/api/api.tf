variable "cluster" {}
variable "iam_role" {}
variable "api_task_definition" {}
variable "desired_count" {}
variable "api_tg_arn" {}
variable "api_container_name" {}
variable "api_container_port" {}
variable "api_service_name" { default = "api_service" }

resource "aws_ecs_service" "api" {
  name = "${var.api_service_name}"
  iam_role = "${var.iam_role}"
  cluster = "${var.cluster}"
  task_definition = "${var.api_task_definition}"
  desired_count = "${var.desired_count}"

  load_balancer {
    target_group_arn = "${var.api_tg_arn}"
    container_port = "${var.api_container_port}"
    container_name = "${var.api_container_name}"
	}

}

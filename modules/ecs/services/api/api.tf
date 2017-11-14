resource "aws_ecs_service" "api" {
  	name = "api-service"
  	iam_role = "${var.ecsServiceRole}"
  	cluster = "${var.cluster}"
  	task_definition = "${var.apiTaskDef}"
  	desired_count = 2

  	load_balancer {
    	target_group_arn = "${var.tg}"
    	container_port = 8443
    	container_name = "api"
	}
}

variable "ecs_instance_profile_name" { default = "ecs_instance_profile" }

module "ecs_instance_role" {
  source = "./roles/ecs-instance"
}

module "ecs_service_role" {
  source = "./roles/ecs-service"
}

module "ecs_role_profile" {
  source = "./profiles/ecs-profile"
  ecs_instance_role_name = "${module.ecs_instance_role.ecs_instance_role_name}"
  ecs_instance_profile_name = "${var.ecs_instance_profile_name}"
}

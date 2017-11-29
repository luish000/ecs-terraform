variable "ecs_instance_profile_name" { default = "ecs_instance_profile" }

module "roles" {
  source = "./roles"
}

module "profiles" {
  source = "./profiles"
  ecs_instance_role_name = "${module.roles.ecs_instance_role_name}"
  ecs_instance_profile_name = "${var.ecs_instance_profile_name}"
}

output "ecs_instance_role_name" {
  value = "${module.roles.ecs_instance_role_name}"
}


output "ecs_instance_profile_name" {
  value = "${module.profiles.ecs_instance_profile_name}"
}

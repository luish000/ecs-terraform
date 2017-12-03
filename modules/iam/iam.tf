variable "ecs_instance_profile_name" { default = "ecs"}

variable "container_ec2_service" {
  default = "ec2.amazonaws.com"
}

variable "container_ecs_service" {
  default = "ecs.amazonaws.com"
}

module "ecs_instance_role" {
  source = "./ecs-role"
  name = "ecs_instance_role"
  service = "${var.container_ec2_service}"
  policy = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

module "ecs_service_role" {
  source = "./ecs-role"
  name = "ecs_service_role"
  service = "${var.container_ecs_service}"
  policy = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

module "ecs_instance_profile" {
  source = "./profile"
  role = "${module.ecs_instance_role.name}"
  name = "${var.ecs_instance_profile_name}"
}

output "instance_role_name" {
  value = "${module.ecs_instance_role.name}"
}

output "instance_profile_name" {
  value = "${module.ecs_instance_profile.name}"
}

variable "ecs_instance_role_name" {}
variable "ecs_instance_profile_name" {}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
    name = "${var.ecs_instance_profile_name}"
    path = "/"
    role = "${var.ecs_instance_role_name}"
}

output "ecs_instance_profile_name" {
  value = "${aws_iam_instance_profile.ecs_instance_profile.name}"
}

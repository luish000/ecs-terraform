variable "role" {}
variable "name" {}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "${var.name}"
  path = "/"
  role = "${var.role}"
}

output "name" {
  value = "${aws_iam_instance_profile.ecs_instance_profile.name}"
}

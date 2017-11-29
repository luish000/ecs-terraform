variable "main_launch_configuration_name" {}
variable "main_image_id" {}
variable "main_instance_type" {}

resource "aws_launch_configuration" "main_launch_configuration" {
  name = "${var.main_launch_configuration_name}"
  image_id = "${var.main_image_id}"
  instance_type = "${var.main_instance_type}"
  iam_instance_profile = "${var.default_iam_profile}"
  security_groups = ["${var.main_sg}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name = "${var.key_pair}"
  user_data = "${template_file.data.rendered}"
}

resource "template_file" "data" {
  template = "${file("${path.module}/templates/user-data.tpl")}"
  vars { ecs-cluster-name = "${var.cluster_name}" }
}

output "main_launch_configuration_name" {
  value = "${aws_launch_configuration.main_launch_configuration.name}"
}

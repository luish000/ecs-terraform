variable "name" {}
variable "ami" {}
variable "instance_type" {}
variable "key_pair" { default = "lhhm" }
variable "iam_profile" {}
variable "associate_public_ip_address" { default = true }
variable "sg" {}
variable "cluster_name" {}
variable "user_data" {}

resource "aws_launch_configuration" "launch_configuration" {
  name = "${var.name}"
  image_id = "${var.ami}"
  instance_type = "${var.instance_type}"
  iam_instance_profile = "${var.iam_profile}"
  security_groups = ["${var.sg}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name = "${var.key_pair}"
  user_data = "${user_data}"
}

output "name" {
  value = "${aws_launch_configuration.launch_configuration.name}"
}

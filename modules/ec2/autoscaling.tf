resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name = "${var.autoscaling_group_name}"
    max_size = "${var.max_instances}"
    min_size = "${var.min_instances}"
    desired_capacity = "${var.desired_capacity}"
    vpc_zone_identifier = ["${var.krexor}", "${var.ironwater}"]
    launch_configuration = "${aws_launch_configuration.noxian_launch_config.name}"
    health_check_type = "ELB"
}

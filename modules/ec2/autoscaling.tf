resource "aws_autoscaling_group" "ecsAutoscalingGroup" {
    name = "${var.autoscaling_group_name}"
    max_size = "${var.max_instances}"
    min_size = "${var.min_instances}"
    desired_capacity = "${var.desired_capacity}"
    vpc_zone_identifier = ["${var.subnet1}", "${var.subnet2}"]
    launch_configuration = "${aws_launch_configuration.launchConfiguration.name}"
    health_check_type = "EC2"
}

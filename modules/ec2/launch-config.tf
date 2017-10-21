resource "aws_launch_configuration" "noxian_launch_config" {
    name = "noxian_launch_config"
    image_id = "${var.image}"
    instance_type = "${var.noxian_instance_type}"
    iam_instance_profile = "${var.noxian_instance_profile}"
    security_groups = ["${var.hew}"]
    associate_public_ip_address = "true"
    key_name = "${var.key_pair}"
    user_data = "${template_file.noxian_launch_config_user_data.rendered}"
}

resource "template_file" "noxian_launch_config_user_data" {
    template = "${file("${path.module}/user-data.tpl")}"

    vars {
        ecs-cluster-name = "${var.cluster_name}"
    }
}

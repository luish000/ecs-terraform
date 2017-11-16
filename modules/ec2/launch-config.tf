resource "aws_launch_configuration" "launchConfiguration" {
    name = "${var.launchConfigurationName}"
    image_id = "${var.image}"
    instance_type = "${var.instanceType}"
    iam_instance_profile = "${var.instanceProfile}"
    security_groups = ["${var.sg}"]
    associate_public_ip_address = "true"
    key_name = "${var.key_pair}"
    user_data = "${template_file.launchConfigurationData.rendered}"
}

resource "template_file" "launchConfigurationData" {
    template = "${file("${path.module}/user-data.tpl")}"

    vars {
        ecs-cluster-name = "${var.cluster_name}"
    }
}

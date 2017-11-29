resource "aws_iam_role" "ecs_instance_role" {
  name = "ecs_instance_role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_instance_role_policy_document.json}"
}

data "aws_iam_policy_document" "ecs_instance_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_policy_attachment" {
    role = "${aws_iam_role.ecs_instance_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

output "ecs_instance_role_name" {
  value = "${aws_iam_role.ecs_instance_role.name}"
}

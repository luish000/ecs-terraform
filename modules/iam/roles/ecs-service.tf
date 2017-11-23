resource "aws_iam_role" "ecs_service_role" {
  name = "ecs_service_role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_service_role_policy_document.json}"
}

data "aws_iam_policy_document" "ecs_service_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_service_role_policy_attachment" {
  role = "${aws_iam_role.ecs_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}


output "ecs_service_role_arn" {
  value = "${aws_iam_role.ecs_service_role.arn}"
}

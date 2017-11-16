resource "aws_iam_role" "ecsServiceRole" {
  name = "ecsServiceRole"
  assume_role_policy = "${data.aws_iam_policy_document.ecsServiceRolePolicyDocument.json}"
}

data "aws_iam_policy_document" "ecsServiceRolePolicyDocument" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsServiceRolePolicyAttachment" {
  role = "${aws_iam_role.ecsServiceRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}


output "ecsServiceRoleArn" {
  value = "${aws_iam_role.ecsServiceRole.arn}"
}

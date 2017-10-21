resource "aws_iam_role" "colonel" {
  name = "colonel"
  assume_role_policy = "${data.aws_iam_policy_document.colonel-functions.json}"
}

data "aws_iam_policy_document" "colonel-functions" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "colonelPolicyAttachment" {
  role = "${aws_iam_role.colonel.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

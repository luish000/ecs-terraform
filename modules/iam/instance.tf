resource "aws_iam_role" "major" {
  name = "major"
  assume_role_policy = "${data.aws_iam_policy_document.major-functions.json}"
}

data "aws_iam_policy_document" "major-functions" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsPolicyAttachment" {
    role = "${aws_iam_role.major.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

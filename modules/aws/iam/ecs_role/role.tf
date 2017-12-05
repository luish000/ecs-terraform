variable "name" {}
variable "service" {}
variable "policy" {}

resource "aws_iam_role" "role" {
  name = "${var.name}"
  assume_role_policy = "${data.aws_iam_policy_document.doc.json}"
}

data "aws_iam_policy_document" "doc" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["${var.service}"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role = "${aws_iam_role.role.name}"
  policy_arn = "${var.policy}"
}

output "name" {
  value = "${aws_iam_role.role.name}"
}

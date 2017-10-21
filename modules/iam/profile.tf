resource "aws_iam_instance_profile" "noxian_instance_profile" {
    name = "instance_profile"
    path = "/"
    role = "${aws_iam_role.major.name}"
}

output "noxian_instance_profile" {
  value = "${aws_iam_instance_profile.noxian_instance_profile.name}"
}

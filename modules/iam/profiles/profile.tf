resource "aws_iam_instance_profile" "ecsInstanceProfile" {
    name = "ecsInstanceProfile"
    path = "/"
    role = "${aws_iam_role.ecsInstanceRole.name}"
}

output "ecsInstanceProfile" {
  value = "${aws_iam_instance_profile.ecsInstanceProfile.name}"
}

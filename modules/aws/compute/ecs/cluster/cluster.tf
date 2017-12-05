variable "name" {}

resource "aws_ecs_cluster" "cluster" {
  name = "${var.name}"
}

output "id" { value = "${aws_ecs_cluster.cluster.id}" }

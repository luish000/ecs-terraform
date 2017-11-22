variable "cluster_name" {}

resource "aws_ecs_cluster" "cluster" {
  name = "${var.cluster_name}"
}

output "cluster_id" { value = "${aws_ecs_cluster.cluster.id}" }

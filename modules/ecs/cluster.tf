resource "aws_ecs_cluster" "ecsCluster" {
    name = "${var.cluster_name}"
}

output "ecsCluster" {
  value = "${aws_ecs_cluster.ecsCluster.id}"
}

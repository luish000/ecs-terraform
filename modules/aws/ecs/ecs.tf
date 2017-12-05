variable "cluster_name" {}

module "cluster" {
  source = "./cluster"
  name = "${var.cluster_name}"
}


/**
 * Noxus is a region in League of legends
 * in our case noxus represents our vpc
 */
resource "aws_vpc" "ecsvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    name = "ECS vpc"
  }
}

output "ecsvpc" {
  value = "${aws_vpc.ecsvpc.id}"
}

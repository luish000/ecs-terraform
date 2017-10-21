
/**
 * Noxus is a region in League of legends
 * in our case noxus represents our vpc
 */
resource "aws_vpc" "noxus" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    name = "noxus"
  }
}

output "noxus" {
  value = "${aws_vpc.noxus.id}"
}

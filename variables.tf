variable "name" {
  default = "ecs"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "primary_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "primary_subnet_name" {
  default = "ecs public subnet 1"
}

variable "secondary_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "secondary_subnet_name" {
  default = "ecs public subnet 2"
}

variable "allow_cidr_block" {
  default = "0.0.0.0/0"
}

variable "allow_ipv6_cidr_block" {
  default = "::/0"
}

variable "ecs_sg_name" {
  default = "ecs_security_group"
}

variable "key_pair" {
  default = "lhhm"
}

variable "cluster_name" {
  default = "myst"
}


variable "region" {
  default = ""
}

variable "main_instance_type" {
  default = "t2.micro"
}

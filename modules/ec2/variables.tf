
variable "hew" {}

variable "krexor" {}

variable "ironwater" {}

variable "noxian_instance_profile" {}

variable "key_pair" {}

variable "cluster_name" {}

variable "max_instances" {
  default = "5"
}

variable "min_instances" {
  default = "2"
}

variable "image" {
  default = "ami-d61027ad"
}

variable "noxian_instance_type" {
  default = "t2.medium"
}


variable "autoscaling_group_name" {
  default = "noxus-autoscaling-group"
}


variable "desired_capacity" {
  default = "3"
}

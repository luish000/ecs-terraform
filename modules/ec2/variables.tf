
variable "sg" {}

variable "subnet1" {}

variable "subnet2" {}

variable "instanceProfile" {}

variable "key_pair" {}

variable "cluster_name" {}

variable "max_instances" {
  default = "1"
}

variable "min_instances" {
  default = "1"
}

variable "desired_capacity" {
  default = "1"
}

variable "image" {
  default = "ami-20ff515a"
}

variable "instanceType" {
  default = "t2.micro"
}


variable "autoscaling_group_name" {
  default = "ecsAutosacalingGroup"
}

variable "launchConfigurationName" {
  default = "launchConfiguration"
}

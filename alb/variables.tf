variable "autoscaling_group_name" {
type    = string
}

variable "public_subnets" {
type    = list(string)
}

variable "vpc_id" {
type    = string
}

variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "ap-southeast-1-azs" {
  description = "availability_zone"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "env-prefix" {
  description = "specific environment"
  default     = "dev"
}

variable "my_ip" {
  type    = string
  default = "124.120.253.59/32"
}

variable "instance_type" {
  default = "t2.large"
}

variable "ami_id" {
  default = "ami-01811d4912b4ccb26"
}
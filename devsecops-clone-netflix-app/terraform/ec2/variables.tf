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
  default = "124.120.251.186/32"
}

variable "jenkins_ip" {
  type = string
  default = "10.0.10.94/32"
  //default = aws_instance.public-instance_1.private_ip
}

variable "prometheus_ip" {
  type = string
  default = "10.0.10.214/32"
  //default = aws_instance.public-instance_2.private_ip
}

variable "instance_type" {
  default = "t2.large"
}

variable "ami_id" {
  default = "ami-01811d4912b4ccb26"
}
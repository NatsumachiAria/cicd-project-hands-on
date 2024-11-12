variable "aws_region" {
  default = "ap-southeast-1"
}

variable "env_prefix" {
  description = "specific environment"
  default     = "dev"
}

variable "vpc_cidr_block" {
  description = "specific vpc cidr block"
  default     = "10.0.0.0/16"
}

variable "public_asso_ip" {
  description = "public_asso_ip" // use for public ip which associated (or reference) in public networking zone
  default     = "10.0.224.16/28"
}

variable "ap-southeast-1-azs" {
  description = "availability_zone"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "private_subnet" {
  description = "private_subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet" {
  description = "private_subnet"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
}

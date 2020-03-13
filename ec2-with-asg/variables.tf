variable "ami_id" {}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-2"
}

variable "VPCId" {}

variable "bucket" {}
variable "key" {}
variable "region" {}

variable "subnet_ids" {
  type = "list"
}
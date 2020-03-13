# Region must be changed


provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {}
}
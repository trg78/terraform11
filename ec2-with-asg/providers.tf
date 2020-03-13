# Region must be changed


provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-s3-2020"
    key    = "ec2withasg/tf.state"
    region = "us-east-2"
  }
}

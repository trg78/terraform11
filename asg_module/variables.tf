variable "environment" {}
variable "name" {}
variable "aws_ami" {}
variable "security_groups" { type = "list" }
variable "instance_type" { default     = "t2.micro" }
variable "iam_instance_profile_arn" {}
variable "subnet_ids" { type = "list" }
variable "enable_monitoring" { default = "false"}
variable "volume_size" { default = "50" }
variable "scale_max_capacity" { default = "4" }
variable "scale_min_capacity" { default = "2" }
variable "desired_capacity" { default = "2" }
variable "key_name" {}

## You can find az zones, via CLI - aws ec2 describe-availability-zones --region us-east-2

variable "availability_zones" { default = ["us-east-2b", "us-east-2c", "us-east-2a"]}
variable "notify_target" { default = "" }
variable "notify_role_arn" { default = "" }
variable "lifecycle_hook" { default = 1 }
variable "user_data" {}
variable "down_alarm_threshold" { default = "20" }
variable "up_alarm_threshold" { default = "70" }
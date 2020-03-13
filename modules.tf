resource "aws_key_pair" "deployer" {
  key_name   = "aws_access_key"
  public_key = "aws_secret_key"
}

data "template_file" "user_data" {
  template = "${file("templates/user_data.sh")}"

  vars {
    package_to_install = "nginx"
  }
}

resource "aws_security_group" "asg-sg" {
  name   = "ClusterSecurityGroup-test"
  vpc_id = "${var.VPCId}"
  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "TCP"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
}

module "ecs-instances" {
  source = "../asg_module"
  environment = "dev"
  name = "tar2020-ASG"
  aws_ami = "${var.ami_id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.asg-sg.id}"]
  iam_instance_profile_arn = "${aws_iam_instance_profile.instance_profile.name}"
  subnet_ids = "${var.subnet_ids}"
  lifecycle_hook = 1
  user_data = "${data.template_file.user_data.rendered}"
}
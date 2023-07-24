resource "aws_launch_template" "ec2app" {
  name          = "LTEc2App${var.project_name}"
  image_id      = var.ec2app_ami
  instance_type = var.instance_type_ec2app
  key_name      = var.key_account
  iam_instance_profile {
    name = var.instance_profile_ec2app
  }
  vpc_security_group_ids = [var.security_group_ec2app]
  tags = {
    Name : "LTEc2${var.project_name}"
    Type : "Terraform"
  }
}

resource "aws_autoscaling_group" "asg_ec2app" {
  name                = "AsgEc2App${var.project_name}"
  vpc_zone_identifier = var.subnets_ec2app
  desired_capacity    = var.desired_capacity_ec2app
  max_size            = var.desired_capacity_ec2app
  min_size            = var.desired_capacity_ec2app

  tag {
    key                 = "Name"
    value               = "Ec2${var.project_name}"
    propagate_at_launch = true
  }

  launch_template {
    id      = aws_launch_template.ec2app.id
    version = "$Latest"
  }
}
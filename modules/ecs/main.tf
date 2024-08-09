resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
}

resource "aws_launch_configuration" "ecs_launch_configuration" {
  name          = "${var.cluster_name}-launch-configuration"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

resource "aws_autoscaling_group" "ecs_autoscaling_group" {
  launch_configuration = aws_launch_configuration.ecs_launch_configuration.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids
}

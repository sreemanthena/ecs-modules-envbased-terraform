provider "aws" {
  region = var.region
}

module "ecs_cluster" {
  source        = "../modules/ecs"
  cluster_name  = var.cluster_name
  instance_type = var.instance_type
  ami_id        = var.ami_id
  key_name      = var.key_name
  min_size      = var.min_size
  max_size      = var.max_size
  desired_capacity = var.desired_capacity
  subnet_ids    = var.subnet_ids
}

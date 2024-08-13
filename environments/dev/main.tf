module "ecs_fargate" {
  source          = "../../modules/ecs_fargate"
  project_name    = var.project_name
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  container_name  = var.container_name
  container_image = var.container_image
  container_port  = var.container_port
}
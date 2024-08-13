module "ecs_fargate" {
  source          = "../../modules/ecs_fargate"
  project_name    = "myapp"
  vpc_id          = "vpc-02a14c26c38857594"
  subnet_ids      = ["subnet-0e89b68055d46ce1a", "subnet-0482f14f5fcd95d89"]
  container_name  = "nginx"
  container_image = "nginx:latest"
  container_port  = 80
}

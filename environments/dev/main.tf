module "ecs_fargate_dev" {
  source = "../../modules/ecs_fargate"

  cluster_name    = "dev-cluster"
  vpc_id             = "vpc-02a14c26c38857594"
  subnet_ids         = ["subnet-0e89b68055d46ce1a", "subnet-0482f14f5fcd95d89"]
#  security_group_ids = ["sg-002e49f08bf28720e"]
  container_name  = "nginx"
  container_image = "nginx:latest"
  container_port  = 80
}

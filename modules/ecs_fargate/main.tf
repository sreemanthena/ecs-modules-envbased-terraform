variable "cluster_name" {}
variable "vpc_id" {}
variable "subnet_ids" {}
variable "container_name" {}
variable "container_image" {}
variable "container_port" {}

# Create ECS Cluster
resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
}

# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.cluster_name}_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Task Definition
resource "aws_ecs_task_definition" "task" {
  family                   = "myapp"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = var.container_name
    image = var.container_image
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
  }])
}

# ECS Service
resource "aws_ecs_service" "service" {
  name            = "myservice"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    assign_public_ip = true
  }
}

variable "project_name" {
  type        = string
  description = "Name of the project, used for resource naming"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the ECS tasks will run"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ECS tasks"
}

variable "container_name" {
  type        = string
  description = "Name of the container to deploy"
}

variable "container_image" {
  type        = string
  description = "Container image to use in the task"
}

variable "container_port" {
  type        = number
  description = "The port on which the container will accept traffic"
}

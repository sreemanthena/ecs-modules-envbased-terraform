variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where the ECS cluster will be located"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to launch resources in"
}

variable "container_name" {
  type        = string
  description = "The name of the container to run"
}

variable "container_image" {
  type        = string
  description = "The Docker image to use for the container"
}

variable "container_port" {
  type        = number
  description = "The port on which the container will listen"
}

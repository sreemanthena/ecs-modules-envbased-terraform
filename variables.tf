variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the ECS cluster instances"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances in the ECS cluster"
  type        = string
}

variable "key_name" {
  description = "Key pair name for the EC2 instances in the ECS cluster"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the ECS cluster Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the ECS cluster Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of the ECS cluster Auto Scaling Group"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS Auto Scaling Group"
  type        = list(string)
}

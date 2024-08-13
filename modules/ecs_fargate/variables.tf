variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the ECS cluster instances"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the ECS instances"
  type        = string
  default     = "ami-0abcdef1234567890" # Change this to a valid ECS-optimized AMI
}

variable "key_name" {
  description = "Key pair name to use for the EC2 instances"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

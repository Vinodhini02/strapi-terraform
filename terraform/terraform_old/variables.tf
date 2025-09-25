variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "ecr_registry" {
  description = "AWS ECR registry URI"
  type        = string
}

variable "ecr_repository" {
  description = "ECR repository name"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag in ECR"
  type        = string
  default     = "latest"
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

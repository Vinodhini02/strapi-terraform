variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "strapi-cluster"
}

variable "ecs_service_name" {
  default = "strapi-service"
}

variable "docker_image" {
  default = "145065858967.dkr.ecr.ap-south-1.amazonaws.com/my-strapi-app:latest"
}

variable "container_port" {
  default = 1337
}

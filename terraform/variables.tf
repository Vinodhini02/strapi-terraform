variable "region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "strapi-cluster"
}

variable "app_name" {
  default = "strapi-app"
}

variable "desired_count" {
  default = 1
}

variable "cpu" {
  default = 512
}

variable "memory" {
  default = 1024
}

variable "container_port" {
  default = 1337
}

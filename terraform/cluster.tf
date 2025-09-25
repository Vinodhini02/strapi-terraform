resource "aws_ecs_cluster" "strapi" {
  name = var.cluster_name
}

# Data source for default VPC/subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

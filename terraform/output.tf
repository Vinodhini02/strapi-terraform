output "ecs_cluster_id" {
  value = aws_ecs_cluster.strapi.id
}

output "ecs_service_name" {
  value = aws_ecs_service.strapi_service.name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.strapi.repository_url
}

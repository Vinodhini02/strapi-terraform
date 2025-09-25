resource "aws_ecr_repository" "strapi" {
  name = "my-strapi-app"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.strapi.repository_url
}

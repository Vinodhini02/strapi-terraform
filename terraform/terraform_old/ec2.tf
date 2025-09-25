resource "aws_instance" "strapi" {
  ami                  = "ami-02d26659fd82cf299"
  instance_type        = "t2.micro"
  key_name             = "vinodhini-newkey"
  security_groups      = [aws_security_group.strapi_sg.name]

  user_data = templatefile("${path.module}/userdata.tpl", {
    REGISTRY   = var.ecr_registry
    REPOSITORY = var.ecr_repository
    TAG        = var.image_tag
    AWS_REGION = var.aws_region
  })

  tags = {
    Name = "strapi-server"
  }
}

output "public_ip" {
  value = aws_instance.strapi.public_ip
}

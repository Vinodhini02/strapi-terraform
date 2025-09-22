resource "aws_instance" "strapi" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "vinodhini-key"

  security_groups      = [aws_security_group.strapi_sg.name]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = templatefile("${path.module}/userdata.tpl", {
    ecr_image_uri = var.ecr_image_uri
    region        = var.aws_region
  })
}

output "public_ip" {
  value = aws_instance.strapi.public_ip
}

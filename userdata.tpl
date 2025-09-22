#!/bin/bash
apt-get update -y
apt-get install -y docker.io awscli
systemctl start docker
systemctl enable docker

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin 145065858967.dkr.ecr.ap-south-1.amazonaws.com/my-strapi-app
docker pull 145065858967.dkr.ecr.ap-south-1.amazonaws.com/my-strapi-app
docker run -d -p 1337:1337 145065858967.dkr.ecr.ap-south-1.amazonaws.com/my-strapi-app

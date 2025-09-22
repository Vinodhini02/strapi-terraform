#!/bin/bash
apt-get update -y
apt-get install -y docker.io awscli
systemctl start docker
systemctl enable docker

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_registry}
docker pull ${ecr_registry}/${ecr_repository}:${image_tag}
docker run -d -p 1337:1337 ${ecr_registry}/${ecr_repository}:${image_tag}

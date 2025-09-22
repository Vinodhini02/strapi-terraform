#!/bin/bash
apt-get update -y
apt-get install -y docker.io awscli
systemctl start docker
systemctl enable docker

REGISTRY="145065858967.dkr.ecr.ap-south-1.amazonaws.com"
REPOSITORY="my-strapi-app"
TAG="latest"

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $REGISTRY
docker pull ${REGISTRY}/${REPOSITORY}:${TAG}
docker stop strapi || true
docker rm strapi || true
docker run -d --name strapi -p 1337:1337 ${REGISTRY}/${REPOSITORY}:${TAG}

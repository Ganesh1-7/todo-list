#!/bin/bash

if [ -f "../backend/.env" ]; then
  source ../backend/.env
else
  echo "❌ .env file not found"
  exit 1
fi

cd ../backend


read -p "Enter the backend Docker image name: " DOCKER_IMAGE_NAME
if [ -z "$DOCKER_IMAGE_NAME" ]; then
  echo "❌ Image name cannot be empty"
  exit 1
fi

read -p "Enter the backend Docker container name: " DOCKER_CONTAINER_NAME
if [ -z "$DOCKER_CONTAINER_NAME" ]; then
  echo "❌ Container name cannot be empty"
  exit 1
fi

docker rm -f $DOCKER_CONTAINER_NAME 2>/dev/null

echo "🚀 Building Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

echo "🚀 Running container..."
docker run -d -p 5000:5000 \
--name $DOCKER_CONTAINER_NAME \
-e DB_HOST="$DB_HOST" \
-e DB_USER="$DB_USER" \
-e DB_PASSWORD="$DB_PASSWORD" \
-e DB_NAME="$DB_NAME" \
$DOCKER_IMAGE_NAME

echo "✅ Backend deployed successfully!"
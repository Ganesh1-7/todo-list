#!/bin/bash

if [ -f "../src/.env" ]; then
  source ../src/.env
else
  echo "❌ .env file not found"
  exit 1
fi

cd ..

read -p "Enter the frontend Docker image name: " DOCKER_IMAGE_NAME
if [ -z "$DOCKER_IMAGE_NAME" ]; then
  echo "❌ Image name cannot be empty"
  exit 1
fi

read -p "Enter the frontend Docker container name: " DOCKER_CONTAINER_NAME
if [ -z "$DOCKER_CONTAINER_NAME" ]; then
  echo "❌ Container name cannot be empty"
  exit 1
fi

docker rm -f $DOCKER_CONTAINER_NAME 2>/dev/null

echo "🚀 Building Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

echo "🚀 Running container..."
docker run -d -p 3000:3000 \
--name $DOCKER_CONTAINER_NAME \
-e REACT_APP_API_URL=$REACT_APP_API_URL \
$DOCKER_IMAGE_NAME

echo "✅ Frontend deployed successfully!"
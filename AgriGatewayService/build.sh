#!/bin/bash
set -e

# Optional: Go to the project directory
cd "$(dirname "$0")"

# Use local mvn wrapper or system mvn
if [ -f "./mvnw" ]; then
  ./mvnw clean package -DskipTests
else
  mvn clean package -DskipTests
fi

# Ensure target exists
if [ ! -d "target" ]; then
  echo "❌ Maven build failed. 'target' directory not found."
  exit 1
fi

# Build and push Docker image
IMAGE_NAME="gcr.io/$GCP_PROJECT_ID/agri-gateway-service"
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME

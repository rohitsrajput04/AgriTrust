#!/bin/bash

set -e

SERVICE_NAME=gateway
PROJECT_ID=${GCP_PROJECT_ID}
IMAGE_NAME=gcr.io/$PROJECT_ID/$SERVICE_NAME

cd AgriGatewayService

# If you are using Maven Wrapper, make sure mvnw exists
mvn clean package -DskipTests

# Build Docker image
docker build -t $IMAGE_NAME .

# Push Docker image
docker push $IMAGE_NAME

#!/bin/bash

# Fail fast
set -e

# Set your project ID
GCP_PROJECT_ID="agritrust-467607"
SERVICE_NAME="agri-gateway-service"

# Find JAR dynamically
JAR_NAME=$(basename $(find target -name '*gateway*.jar' | head -n 1))

# Authenticate with gcloud if not already done
#gcloud auth login
#gcloud config set project $GCP_PROJECT_ID

# Build docker image with the JAR name as build-arg
docker build --build-arg JAR_NAME=$JAR_NAME -t gcr.io/$GCP_PROJECT_ID/$SERVICE_NAME .

# Push to GCR
docker push gcr.io/$GCP_PROJECT_ID/$SERVICE_NAME

# Deploy to Cloud Run
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$GCP_PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region asia-south1 \
  --allow-unauthenticated \
  --timeout 600

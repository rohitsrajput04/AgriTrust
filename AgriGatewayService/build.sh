#!/bin/bash
set -e

cd AgriGatewayService

# 1. Build the Java project
./mvnw clean package -DskipTests

# 2. Find the generated JAR file
JAR_FILE=$(find target -type f -name "*.jar" | head -n 1)

if [[ -z "$JAR_FILE" ]]; then
  echo "❌ JAR file not found in target directory!"
  exit 1
fi

# 3. Dynamically extract service name from JAR filename (optional)
IMAGE_NAME="agri-gateway-service"

# 4. Build Docker image
docker build -t gcr.io/$GCP_PROJECT_ID/$IMAGE_NAME .

# 5. Push to GCR
docker push gcr.io/$GCP_PROJECT_ID/$IMAGE_NAME

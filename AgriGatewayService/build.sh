#!/bin/bash
set -e

cd AgriGatewayService

# 1. Build the project using system Maven
mvn clean package -DskipTests

# 2. Find the generated JAR file
JAR_FILE=$(find target -type f -name "*.jar" | head -n 1)

if [[ -z "$JAR_FILE" ]]; then
  echo "❌ JAR file not found in target directory!"
  exit 1
fi

# 3. Copy JAR to current directory for Dockerfile
cp "$JAR_FILE" app.jar

# 4. Build Docker image
docker build -t gcr.io/$GCP_PROJECT_ID/agri-gateway-service .

# 5. Push Docker image
docker push gcr.io/$GCP_PROJECT_ID/agri-gateway-service

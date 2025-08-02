#!/bin/bash
set -e

# Clean and build using system Maven (remove ./mvnw)
mvn clean package -DskipTests

# Dynamically find the jar file name
JAR_NAME=$(basename $(find target -name '*gateway*.jar' | head -n 1))

if [ -z "$JAR_NAME" ]; then
  echo "❌ No matching JAR file found in target/"
  exit 1
fi

echo "✅ Found JAR: $JAR_NAME"

# Docker build using dynamic JAR name
docker build --build-arg JAR_NAME=$JAR_NAME -t gcr.io/agritrust-467607/agri-gateway-service .

#!/bin/bash
set -e

./mvnw clean package -DskipTests

# Find the JAR file dynamically
JAR_FILE=$(find target -name "*gateway*.jar" | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ No matching JAR found"
  exit 1
fi

# Rename to app.jar for Docker
cp "$JAR_FILE" app.jar

docker build -t gcr.io/agritrust-467607/agri-gateway-service .

# Clean up
rm app.jar

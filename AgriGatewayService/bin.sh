#!/bin/bash

# Find the first JAR matching pattern
JAR_FILE=$(find target -type f -name '*gateway*.jar' | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ No JAR file found matching '*gateway*.jar'"
  exit 1
fi

echo "✅ Found JAR: $JAR_FILE"

# Copy with static name so Docker can COPY it
cp "$JAR_FILE" app.jar

# Build Docker image
docker build -t gcr.io/${GCP_PROJECT_ID}/agri-gateway-service .

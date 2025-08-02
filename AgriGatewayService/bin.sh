#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "📦 Step 1: Building Maven project..."
mvn clean package -DskipTests

echo "🔍 Step 2: Searching for JAR file..."
JAR_FILE=$(find target -type f -name '*gateway*.jar' | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ No matching JAR file found!"
  exit 1
fi

echo "✅ Found JAR: $JAR_FILE"

echo "📁 Step 3: Copying JAR to app.jar"
cp "$JAR_FILE" app.jar

echo "🐳 Step 4: Building Docker image..."
docker build -t gcr.io/agritrust-467607/agri-gateway-service .

# Optional cleanup
echo "🧹 Cleaning up temporary app.jar..."
rm app.jar

echo "🎉 Done! Docker image built successfully."

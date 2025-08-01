# Dockerfile
FROM openjdk:17-jdk-slim
COPY . /app.jar

# Cloud Run expects the app to listen on port 8080
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]

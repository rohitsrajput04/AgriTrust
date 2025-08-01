# Dockerfile
FROM openjdk:17-jdk-slim
# Cloud Run expects the app to listen on port 8080
EXPOSE 8080
COPY . /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]

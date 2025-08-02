# Use minimal base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Accept JAR name as a build argument
ARG JAR_NAME

# Copy the JAR into container
#COPY target/*gateway*.jar app.jar
COPY target/agri-gateway-service-1.0.0.jar app.jar

# Expose port used by Spring Boot
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "app.jar", "--server.port=8080"]

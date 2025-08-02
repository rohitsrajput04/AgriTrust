# Use minimal base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Accept JAR name as a build argument
ARG JAR_NAME

# Copy the JAR into container
COPY target/${JAR_NAME} app.jar

# Expose port used by Spring Boot
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "app.jar"]

# Step 1: Use Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Copy project files into the builder image
COPY . /app

# Build the app
RUN mvn -f /app/pom.xml clean package -DskipTests

# Step 2: Use a smaller JDK base image to run the app
FROM eclipse-temurin:17-jdk-alpine

# Create app directory
WORKDIR /app

# Copy the built jar from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]

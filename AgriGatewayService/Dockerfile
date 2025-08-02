# Use a Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Copy project files into the container
COPY . /app

# Build the application (skipping tests for speed)
RUN mvn -f /app/pom.xml clean package -DskipTests

# Second stage: run the app with a smaller base image
FROM eclipse-temurin:17-jdk

# Copy only the JAR from the builder stage
COPY --from=builder /app/target/*.jar /app/app.jar

# Set the working directory
WORKDIR /app

# Expose the port Cloud Run expects
EXPOSE 8080

# Set the PORT environment variable (not required but helpful)
ENV PORT=8080

# Run the built JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]

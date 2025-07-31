# Use a Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17

# Copy project files into the container
COPY . /app

# Build the application (skipping tests for speed)
RUN mvn -f /app/pom.xml clean package -DskipTests

# Run the built JAR file
ENTRYPOINT ["java", "-jar", "/app/target/app.jar"]
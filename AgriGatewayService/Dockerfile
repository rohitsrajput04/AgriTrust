FROM openjdk:17-jdk-slim
WORKDIR /app

ARG JAR_NAME
COPY target/${JAR_NAME} app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

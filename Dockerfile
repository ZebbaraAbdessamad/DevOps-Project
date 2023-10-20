# Use a base image with Java and a minimal Linux distribution
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Expose the port your Spring Boot app is running on (default is 8080)
EXPOSE 8080

# Copy the JAR file into the container
COPY target/spring-boot-k8s.jar spring-boot-k8s.jar

# efine the command to run your Spring Boot application / can be overridden at runtime of your docker container .
CMD  ["java", "-jar", "spring-boot-k8s.jar"]

# FROM ghcr.io/graalvm/native-image:java17 as builder

# WORKDIR /app

# COPY pom.xml .
# COPY src/main/java .

# RUN mvn package -Dnative-image

# FROM scratch

# COPY --from=builder /app/target/my-java-app /app

# EXPOSE 8080

# CMD ["/app/my-java-app"]

# FROM ubuntu:jammy
# EXPOSE 8080
# COPY target/demo-0.0.1-SNAPSHOT.jar /my-java-app
# CMD ["/my-java-app"]



# Use a base image with OpenJDK
FROM openjdk:17-jdk-slim

# Expose the port the app runs on
EXPOSE 8080

# Copy the JAR file into the container
COPY target/demo-0.0.1-SNAPSHOT.jar /my-java-app/demo-0.0.1-SNAPSHOT.jar

# Set the entry point to run the JAR file
ENTRYPOINT ["java", "-jar", "/my-java-app/demo-0.0.1-SNAPSHOT.jar"]

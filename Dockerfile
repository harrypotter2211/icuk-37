# Stage 1: Build the project with Maven and run all tests
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .

# Run full build with tests (default behavior)
RUN mvn clean package

# Stage 2: Use a lightweight image to run the built JAR
FROM openjdk:8

# Copy the built JAR from the correct submodule path
# Replace `server` and the JAR name if your main module is different
COPY --from=build /app/server/target/server-1.0-SNAPSHOT.jar demo-workshop.jar

# Run the application
ENTRYPOINT ["java", "-jar", "demo-workshop.jar"]

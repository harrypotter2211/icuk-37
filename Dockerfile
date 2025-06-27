# Stage 1: Build
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:8
# Copy the JAR from the module you want to run
COPY --from=build /app/server/target/server-1.0-SNAPSHOT.jar demo-workshop.jar
ENTRYPOINT ["java", "-jar", "demo-workshop.jar"]

FROM openjdk:8

# Copy the built JAR into the container
COPY target/demo-workshop-2.0.1.jar demo-workshop.jar

# Set the default command
ENTRYPOINT ["java", "-jar", "demo-workshop.jar"]

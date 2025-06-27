FROM openjdk:8

# Copy the built JAR into the image
COPY target/demo-workshop-2.0.1.jar demo-workshop.jar

# Run the application
ENTRYPOINT ["java", "-jar", "demo-workshop.jar"]

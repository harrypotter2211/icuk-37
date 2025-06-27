# Stage 1: Build the WAR using Maven with tests
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .

# Run full build (tests are enabled by default)
RUN mvn clean package

# Stage 2: Deploy WAR to Tomcat
FROM tomcat:9.0

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy built WAR from the taxi-booking module and rename to ROOT.war
COPY --from=build /app/taxi-booking/target/taxi-booking-1.0.1.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

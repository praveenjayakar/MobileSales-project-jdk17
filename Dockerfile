# Build Stage
FROM maven:3.8.3-openjdk-17 AS builder
WORKDIR /app

# Copy and resolve dependencies first (better caching)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src/ src/
RUN mvn clean package -DskipTests=true

# Runtime Stage
FROM openjdk:17-alpine
WORKDIR /app

# Download Elastic APM Agent
COPY elastic-apm-agent.jar elastic-apm-agent.jar
# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Run the application with Elastic APM agent, using environment variables
CMD java \
    -javaagent:/app/elastic-apm-agent.jar \
    -Delastic.apm.service_name=${ELASTIC_APM_SERVICE_NAME:-my-application} \
    -Delastic.apm.server_urls=${ELASTIC_APM_SERVER_URLS:-http://localhost:8200} \
    -Delastic.apm.secret_token=${ELASTIC_APM_SECRET_TOKEN:-} \
    -Delastic.apm.environment=${ELASTIC_APM_ENVIRONMENT:-production} \
    -Delastic.apm.application_packages=${ELASTIC_APM_APPLICATION_PACKAGES:-org.example} \
    -jar app.jar


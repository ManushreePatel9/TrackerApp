# Step 1: Use Maven with Amazon Corretto 21 (lightweight Alpine)
FROM maven:3.9.9-amazoncorretto-21-alpine AS builder

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy pom.xml first (so dependencies can be cached)
COPY pom.xml .

# Step 4: Download dependencies (optional optimization)

# Step 5: Copy all source files
COPY src ./src

# Step 6: Build the project
RUN mvn clean package -DskipTests

# Step 7: Use a smaller JDK image for running the app
FROM amazoncorretto:21-alpine

WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/TrackerApp-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]

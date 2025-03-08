# Use a base image with JDK 21
FROM eclipse-temurin:21-jdk AS build

# Set the working directory
WORKDIR /app

# Copy Maven project and build
COPY . .
RUN ./mvnw clean package -DskipTests

# Use a lightweight JDK runtime image
FROM eclipse-temurin:21-jre AS runtime

WORKDIR /app
COPY --from=build /app/target/my-app.jar /app/app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

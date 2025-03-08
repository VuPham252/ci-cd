# Use a base image with JDK 21
FROM eclipse-temurin:21-jdk
ARG JAR_FILE=target/*jar
COPY ./target/demo1-0.0.1-SNAPSHOT.jar ci-cd.jar
ENTRYPOINT ["java", "-jar", "/app/ci-cd.jar"]

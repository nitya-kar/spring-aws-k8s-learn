FROM maven:3.8.4-openjdk-17-slim AS builder
COPY pom.xml /app/
COPY src /app/src
RUN mvn -f /app/pom.xml clean package

FROM openjdk:17-jdk-alpine
COPY --from=builder /app/target/*.jar /app/aws-k8s-learn.jar
ENTRYPOINT ["java", "-jar", "/app/aws-k8s-learn.jar"]
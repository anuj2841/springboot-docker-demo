# Stage 1: Build with Maven and JDK
FROM docker.io/library/maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy pom and source code
COPY pom.xml .
COPY src ./src

# Build jar
RUN mvn package -DskipTests

# Stage 2: Run with JDK only
FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/target/springboot-hello-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java","-jar","app.jar"]
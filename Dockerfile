# Utiliser une image de base avec OpenJDK et Maven préinstallés
# Builder stage
FROM maven:3.8.4-openjdk-17 AS build

WORKDIR /app
COPY pom.xml .

RUN mvn dependency:go-offline
COPY src/ /app/src/

RUN mvn clean package -Dmaven.test.skip


# Runtime stage
FROM openjdk:17-slim
WORKDIR /app

# Copy the built Java application from the build stage
COPY --from=build /app/target/hackwhitehat-0.0.1-SNAPSHOT.jar /app/hackwhitehat-0.0.1-SNAPSHOT.jar

# Run the Java application
CMD ["java", "-jar", "hackwhitehat-0.0.1-SNAPSHOT.jar"]
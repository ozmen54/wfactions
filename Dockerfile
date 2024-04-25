FROM openjdk:17-alpine AS builder
COPY . .
WORKDIR .
RUN ./gradlew bootJar

FROM openjdk:17-alpine
WORKDIR .
COPY --from=builder build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
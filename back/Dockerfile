FROM gradle:6.1-jdk13 AS builder
COPY . /app
RUN gradle -p /app clean assemble

FROM openjdk:13-jdk-alpine
COPY --from=builder /app/build/libs/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
# Build environment
FROM gradle:6.1-jdk11 AS builder

COPY . /app

RUN gradle --no-daemon -p /app assemble

# Run environment
FROM openjdk:11

COPY --from=builder /app/build/libs/*.jar /app/app.jar

HEALTHCHECK --interval=5s --timeout=2s --retries=6 \
  CMD curl -sf http://localhost:8080/health/live || exit 1

ENV DB_HOST=localhost \
  DB_PORT=5432 \
  DB_SCHEMA=example \
  DB_USERNAME=example \
  DB_PASSWORD=example

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]

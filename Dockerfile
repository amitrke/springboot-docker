FROM maven:3.8.3-jdk-8 AS builder
ARG SERVICE
RUN mkdir -p ./${SERVICE}

COPY ./src ./${SERVICE}/src
COPY ./pom.xml ./${SERVICE}

WORKDIR ${SERVICE}
RUN mvn clean install spring-boot:repackage

FROM openjdk:11
ARG ENV_PROFILE
COPY --from=builder /demo/target/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=${ENV_PROFILE}", "demo.jar"]

EXPOSE 8081
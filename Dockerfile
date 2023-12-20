FROM maven:3.8.4-jdk-8-slim as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean install -DskipTests=true
FROM openjdk:8u171-jre-alpine
WORKDIR /app
COPY --from=maven target/spring-boot-mongo-1.0.jar  ./spring-boot-mongo-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-boot-mongo-1.0.jar"]
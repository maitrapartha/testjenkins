FROM openjdk:11
VOLUME /tmp
ADD target/hello-service.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "/app.jar"]

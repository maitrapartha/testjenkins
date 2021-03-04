FROM openjdk:11
VOLUME /tmp
ADD target/hello-service.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

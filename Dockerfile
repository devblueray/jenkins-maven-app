FROM openjdk:8-jre-alpine
ADD target/my-app-1.0-SNAPSHOT.jar /opt
WORKDIR /opt
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]

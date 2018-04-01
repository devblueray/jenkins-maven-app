FROM openjdk:8-jre-alpine
ADD target/my-app-1.0-SNAPSHOT.jar /root
WORKDIR /root
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]

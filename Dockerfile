From java:8-alpine
ADD springboot-demo-0.0.1-SNAPSHOT.jar test.jar
EXPOSE 8088
ENTRYPOINT ["java","-jar","/test.jar"]
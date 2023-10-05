FROM openjdk:17-jdk-slim AS BUILD_IMAGE
WORKDIR /usr/src/app/
RUN apt update && apt install maven -y
COPY ./ /usr/src/app/
RUN mvn install -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /usr/src/app/
COPY --from=BUILD_IMAGE /usr/src/app/target/rest-service-complete-0.0.1-SNAPSHOT.jar ./app.jar


#VOLUME /tmp
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=default", "/usr/src/app/app.jar"]
#ENTRYPOINT echo "Hello world"

# build stage
FROM registry.access.redhat.com/ubi8/openjdk-8:latest AS build-stage 
WORKDIR /app
COPY --chown=jboss:root /ez-learning/pom.xml /app
RUN mvn dependency:go-offline
COPY --chown=jboss:root /ez-learning/src /app/src
RUN mvn clean package -Dmaven.test.skip=true

# run stage
FROM registry.access.redhat.com/ubi8/openjdk-8:latest
WORKDIR /app
COPY --from=build-stage /app/target/*.jar platform.jar
EXPOSE 8080
CMD ["java", "-Dspring.profiles.active=prod", "-jar", "platform.jar"]
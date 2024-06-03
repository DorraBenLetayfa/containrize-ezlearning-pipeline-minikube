# build stage
FROM builder-image AS build-stage 
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src

# run stage
FROM openjdk:8
COPY --from=build-stage /path/in/build/stage /path/to/place/in/final/stage
EXPOSE 8080
CMD ["java"]
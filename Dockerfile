# Use the official Gradle image as the build environment.
FROM gradle:7.4.0-jdk17 AS build

# Set the working directory in the Docker image
WORKDIR /app

# Copy the Gradle configuration files to leverage Docker layer caching
COPY ./gradlew ./gradlew.bat ./gradle ./settings.gradle ./build.gradle /app/
COPY ./settings.gradle /app/

# Copy source code
COPY ./src /app/src

RUN gradle clean build --no-daemon -x test

# Use OpenJDK for running the application
FROM openjdk:17-jdk

# Expose port 5000 for the application
EXPOSE 5000

# Copy over the built artifact from the builder stage
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Specify the entry point of the application
CMD ["java", "-jar", "/app/app.jar"]

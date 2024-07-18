# java-maven

FROM openjdk:8-jre-alpine

# informs Docker that the container will listen on port 8080 and makes it available for communication with the host or other containers
EXPOSE 8080

# copies the java-maven-app-1.1.0-SNAPSHOT.jar file from the local ./target/ directory to the /usr/app/ directory inside the container
COPY ./target/java-maven-app-1.1.0-SNAPSHOT.jar /usr/app/

# sets the working directory inside the container to /usr/app
WORKDIR /usr/app

# specifies the command that will be executed when the container starts.
# It runs the Java application by executing java -jar java-maven-app-1.1.0-SNAPSHOT.jar inside the container
ENTRYPOINT ["java", "-jar", "java-maven-app-1.1.0-SNAPSHOT.jar"]
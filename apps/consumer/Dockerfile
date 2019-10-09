FROM maven:3.6.1-jdk-11-slim

WORKDIR /usr/src/java-code
COPY ./pom.xml ./pom.xml

RUN mvn dependency:go-offline -B

COPY . ./
RUN mvn package -DskipTests

WORKDIR /usr/src/java-app
RUN cp /usr/src/java-code/target/*.jar ./app.jar

CMD ["java", "-jar", "app.jar"]
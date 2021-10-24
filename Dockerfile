FROM maven:3.8.1-openjdk-11-slim as build-service
WORKDIR /app
COPY . . 
# ARG GITHUB_TOKEN=""
# ARG GITHUB_USER="drpdishant"
# RUN sed -i "s%__GITHUB_USER__%${GITHUB_USER}%g;s%__GITHUB_TOKEN__%${GITHUB_TOKEN}%g" settings.xml
# RUN sed -i "s%<packaging>war</packaging>%<packaging>jar</packaging>%g" pom.xml
RUN mvn package -DskipTests

FROM openjdk:11-jdk-slim
WORKDIR /app
ARG JAR_FILE=/app/target/*.jar
ARG JAVA_OPTS=""
COPY --from=build-service ${JAR_FILE} /app/app.jar
# COPY dmdlegtekgrabgem.json /dmdlegtekgrabgem.json
# COPY application.yml /app/application.yml
ENV JAVA_OPTS=${JAVA_OPTS}
CMD exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=$PROFILE -XX:+UseSerialGC -Xss512k -XX:MaxRAM=600m -jar /app/app.jar


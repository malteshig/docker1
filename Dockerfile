FROM maven:3.8.2-openjdk-8 as test1
ARG TEST=/var/lib/
WORKDIR ${TEST}
COPY . .
RUN mvn clean package

FROM tomcat:jre8-temurin-focal
ARG TEST=/var/lib
COPY --from=test1 ${TEST}/target/hello-world-war-1.0.1.war /usr/local/tomcat/webapps

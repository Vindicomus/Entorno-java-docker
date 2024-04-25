FROM mcr.microsoft.com/java/jdk:17-zulu-alpine

WORKDIR /usr/src/app

COPY Main.class /usr/src/app/

ENV ECLIPSE_WORKSPACE=/usr/src/app

CMD ["java", "-jar", "/usr/local/lib/mysql-connector-java-8.0.17.jar"]

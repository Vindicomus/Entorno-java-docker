DOCKERFILE

El Dockerfile describe cómo construir la imagen Docker para tu aplicación Java conectada a MySQL.
-----------------------------------------------------------------
FROM mcr.microsoft.com/java/jdk:17-zulu-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia el archivo Main.class al directorio de trabajo dentro del contenedor
COPY Main.class /usr/src/app/

# Define la variable de entorno para el workspace de Eclipse
ENV ECLIPSE_WORKSPACE=/usr/src/app

# Comando para ejecutar la aplicación Java
CMD ["java", "-jar", "/usr/local/lib/mysql-connector-java-8.0.17.jar"]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DOCKER-COMPOSE.yml
El archivo docker-compose.yml describe cómo ejecutar y configurar los contenedores Docker para tu aplicación Java y MySQL.

--------------------------------------------------------------------
version: '3.8'

services:
  java-mysql-container:
    image: mcr.microsoft.com/java/jdk:17-zulu-alpine
    container_name: java-mysql-campusfp
    volumes:
      - ./mysql-connector-java-8.0.17.jar:/usr/local/lib/mysql-connector-java-8.0.17.jar
      - c:/programacion:/usr/src/app
    environment:
      - ECLIPSE_WORKSPACE=c:/programacion
    ports:
      - "8080:8080"
    command: java -jar /usr/local/lib/mysql-connector-java-8.0.17.jar

  mysql:
    image: mysql:latest
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    ports:
      - "3308:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:


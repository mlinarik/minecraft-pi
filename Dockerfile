FROM openjdk:17-jdk-slim-buster as base

FROM base as builder
RUN apt-get update -y && apt-get install wget -y && \
   mkdir /mcdata && mkdir /temp

RUN wget -c https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/266/downloads/paper-1.17.1-266.jar -O /temp/server.jar && \
   touch /temp/eula.txt && echo "eula=true" > /temp/eula.txt

FROM builder
WORKDIR /mcdata
EXPOSE 25565
CMD ["mv /temp/*.* /mcdata && java -Xms4G -jar server.jar nogui"]

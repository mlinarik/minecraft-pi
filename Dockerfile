FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y && \
   apt-get update && apt-get install wget -y && apt-get install openjdk-8-jdk-headless -y && apt-get install wget -y && \
   mkdir mcdata && mkdir temp

WORKDIR /mcdata

CMD wget -cO - https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/706/downloads/paper-1.16.5-706.jar > server.jar && \
    touch eula.txt && echo "eula=true" > eula.txt && java -Xms4G -jar server.jar nogui

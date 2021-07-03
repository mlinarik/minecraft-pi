FROM ubuntu:20.10

RUN apt-get update -y && apt-get upgrade -y && \
   apt-get update && apt-get install wget -y && apt-get install openjdk-8-jdk-headless -y && apt-get install wget -y && \
   mkdir /mcdata && mkdir /temp

RUN wget -c https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/706/downloads/paper-1.16.5-706.jar -O /temp/server.jar && \
   touch /temp/eula.txt && echo "eula=true" > /temp/eula.txt

WORKDIR /mcdata

CMD mv /temp/*.* /mcdata && \
   java -Xms4G -jar server.jar nogui

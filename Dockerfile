FROM ubuntu:20.10

EXPOSE 25565

RUN apt-get update -y && apt-get upgrade -y && \
   apt-get install wget -y && apt-get install openjdk-16-jdk-headless -y && apt-get install wget -y && \
   mkdir /mcdata && mkdir /temp

RUN wget -c https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/259/downloads/paper-1.17.1-265.jar -O /temp/server.jar && \
   touch /temp/eula.txt && echo "eula=true" > /temp/eula.txt

WORKDIR /mcdata

CMD mv /temp/*.* /mcdata && java -Xms4G -jar server.jar nogui

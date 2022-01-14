#Parent Image
FROM mlinarik/builder:ubuntu-pi as base

#Builder
FROM base as paper-builder

RUN apt-get update -y && apt-get install wget -y && \
   mkdir /mcdata && mkdir /temp  && mkdir /plugins && \
   wget -c https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/71/downloads/paper-1.18.1-71.jar -O /temp/server.jar && \
   touch /temp/eula.txt && echo "eula=true" > /temp/eula.txt

#Runtime
FROM mlinarik/builder:ubuntu-pi as runtime

RUN apt-get update -y && \
   apt-get upgrade -y && \
   apt-get clean all && \
   mkdir /temp && \
   mkdir /mcdata

COPY --from=paper-builder /temp /temp

WORKDIR /mcdata

EXPOSE 25565

CMD mv /temp/*.* /mcdata && java -Xms4G -jar server.jar nogui

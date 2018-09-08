FROM mono:5.14.0

ARG version=0.12.49

RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://github.com/LunaMultiplayer/LunaMultiplayer/releases/download/$version/LunaMultiplayer-Release.zip && \
    unzip LunaMultiplayer-Release.zip && \
    rm -rf LMPClient && \
    rm -f LunaMultiplayer-Release.zip

EXPOSE 8800/udp

WORKDIR /LMPServer

ENTRYPOINT ["mono"]
CMD ["Server.exe"]

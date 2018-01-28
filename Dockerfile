FROM debian:latest
RUN apt-get update && apt-get install -y curl
RUN curl -o /home/btsync.tar.gz https://raw.githubusercontent.com/FreemanZY/BTSync-DHT-Docker/master/btsync_x64-1.4.111.tar.gz
RUN cd /home && tar -xvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir /home/.sync
RUN mkdir /home/data
ADD btsync.conf /home
EXPOSE 8888
EXPOSE 17173
VOLUME ["/data"]
ENTRYPOINT ["/home/btsync","--config /home/btsync.conf"]

FROM debian:latest
WORKDIR /home
RUN apt-get update && apt-get install -y curl \
    && curl -o /home/btsync.tar.gz https://raw.githubusercontent.com/FreemanZY/BTSync-DHT-Docker/master/btsync_x64-1.4.111.tar.gz \
    && tar -xvf btsync.tar.gz && rm btsync.tar.gz \
    && mkdir .sync data \
    && apt-get purge -y --auto-remove curl
ADD btsync.conf /home
EXPOSE 8888
EXPOSE 17173
VOLUME ["/home/data"]
ENTRYPOINT ["/home/btsync"]
CMD ["--config", "/home/btsync.conf", "--nodaemon"]

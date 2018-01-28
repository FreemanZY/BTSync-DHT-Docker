FROM debian:latest
ADD btsync_x64-1.4.111.tar.gz /home
ADD btsync.conf /home
RUN cd /home && tar -xvf btsync_x64-1.4.111.tar.gz && rm btsync_x64-1.4.111.tar.gz
RUN mkdir /home/.sync
RUN mkdir /home/data
EXPOSE 8888
EXPOSE 17173
VOLUME ["/data"]
ENTRYPOINT ["/home/btsync","--config /home/btsync.conf"]
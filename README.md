# BTSync-DHT-Docker
BTSync Ver.1.4.111, the last one with DHT.

The purpose of the project is letting people deploy the sync through DHT quickly.

---

The package hash is as below:

**SHA256**

btsync_x64-1.4.111.tar.gz

6ea03cd2f60177baca58c701b80e1abf44b7c42fc4ec5b8bcfd3b266876e832f

# Usage

    DATA_FOLDER=/path/to/data/folder/on/the/host
    WEBUI_PORT=[ port to access the webui on the host ]

    mkdir -p $DATA_FOLDER

    docker run -d --name Sync \
      -p 127.0.0.1:$WEBUI_PORT:8888 -p 55555 \
      -v $DATA_FOLDER:/mnt/sync \
      --restart on-failure \
      freemanzy/btsync-dht-docker

Go to localhost:$WEBUI_PORT in a web browser to access the webui.

#### LAN access

If you do not want to limit the access to the webui to localhost, run instead:

    docker run -d --name Sync \
      -p $WEBUI_PORT:8888 -p 55555 \
      -v $DATA_FOLDER:/mnt/sync \
      --restart on-failure \
      freemanzy/btsync-dht-docker

#### Extra directories

If you need to mount extra directories, mount them in /mnt/mounted_folders:

    docker run -d --name Sync \
      -p 127.0.0.1:$WEBUI_PORT:8888 -p 55555 \
      -v $DATA_FOLDER:/mnt/sync \
      -v <OTHER_DIR>:/mnt/mounted_folders/<DIR_NAME> \
      -v <OTHER_DIR2>:/mnt/mounted_folders/<DIR_NAME2> \
      --restart on-failure \
      freemanzy/btsync-dht-docker

Do not create directories at the root of mounted_folders from the Sync webui since this new folder will not be mounted on the host.

# Volume

* /mnt/sync - State files and Sync folders

# Ports

* 8888 - Webui
* 55555 - Listening port for Sync traffic

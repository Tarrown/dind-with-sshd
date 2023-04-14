# Dind container with sshd
## Overview
Docker in Docker(dind) container with sshd

<img width=50% src=./images/overview.png>

## Usase
build and run containers
```bash
$ /bin/bash up.sh
```

containers on localhost
```bash
$ docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED              STATUS              PORTS                                                       NAMES
e58a3ec3c6ca   dind-with-sshd-batch   "/bin/bash"              About a minute ago   Up About a minute                                                               batch-container
5b27f7852862   dind-with-sshd-host    "dockerd-entrypoint.…"   About a minute ago   Up About a minute   2375-2376/tcp, 0.0.0.0:2022->22/tcp, 0.0.0.0:1080->80/tcp   host-container
```
batch-container can access to host-container via ssh with pubkey

containers on host-container
```sh
/ # docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS                NAMES
d4cd77a44d3d   mnt-guest   "/bin/sh work/simple…"   4 minutes ago   Up 4 minutes   0.0.0.0:80->80/tcp   guest-container
```
guest-container is a simple http server on host-container

If you access `localhost:1080`, you can access guest-container.
```bash
$ curl http://localhost:1080/index.html
<html>
<font color="black">Hello</font>
</html>
```
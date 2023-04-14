#!/bin/bash
echo "###########################################
# HOST container up...
###########################################
"
docker-compose up -d --build && /bin/bash ./cp_ssh_key.sh

echo "###########################################
# Waiting for starting dind...
###########################################
"
sleep 10

echo "###########################################
# GUEST container up...
###########################################
"
docker exec -it host-container sh -c 'cd /work/guest/mnt && docker-compose up -d --build'



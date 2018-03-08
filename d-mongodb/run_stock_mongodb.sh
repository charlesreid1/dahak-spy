#!/bin/bash

HOSTIP="10.11.0.192"
MONGODATA="${PWD}/mongo-data"
#INTERACTIVE=false
#INTERACTIVE=true

# Remove dead containers
docker container prune -f

docker run \
        --name philby_mongo \
        -v ${MONGODATA}:/data/db \
        -v ${PWD}conf/mongod.conf:/etc/mongod.conf \
        -d \
        mongo \
        --conf /etc/mongod.conf

if [ "$INTERACTIVE" == true ]; 
then
    echo
else
    echo
fi


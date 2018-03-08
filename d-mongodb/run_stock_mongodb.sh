#!/bin/bash

HOSTIP="10.11.0.192"
MONGODATA="${PWD}/mongo-data"
#INTERACTIVE=false
#INTERACTIVE=true

# Remove dead containers
docker container prune -f

# Note: all *kinds* of permissions problems
# coming from mounting directories directly
# between host and container.
# Use docker volumes instead.
# Set config options on the command line.

docker run \
    -v philby_mong_data:/data \
    --name philby_mongo \
    -i \
    mongo --bind_ip ${HOSTIP}


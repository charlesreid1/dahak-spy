#!/bin/bash

function usage {
    echo ""
    echo "run_stock_mongoexpress.sh script:"
    echo "run the mongo express docker container."
    echo ""
    echo "        ./run_stock_mongoexpress.sh [<bind-ip-address>]" 
    echo ""
    exit 1;
}

if [[ "$#" -gt 1 ]];
then
    usage
elif [[ "$#" -e 1 ]];
then
    HOSTIP="$1"
else
    HOSTIP="10.11.0.192"
fi

# Remove dead containers
docker container prune -f

docker run \
    --name angleton_express \
    -it \
    --rm \
    --link philby_mongo:mongo \
    -p 8081:8081 \
    -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
    -e ME_CONFIG_MONGODB_ENABLE_ADMIN="true" \
    -d \
    mongo-express

# specify the mongo db admin username/password
#        -e ME_CONFIG_MONGODB_ADMINUSERNAME="mongo" \
#        -e ME_CONFIG_MONGODB_ADMINPASSWORD="<mongo-pw>" \

# specify the mongoexpress web interface username/password
#        -e ME_CONFIG_BASICAUTH_USERNAME="mongoexpress" \
#        -e ME_CONFIG_BASICAUTH_PASSWORD="<mongoexpress-pw>" \


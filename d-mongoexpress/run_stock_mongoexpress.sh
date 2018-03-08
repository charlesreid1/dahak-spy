#!/bin/bash
#
# don't touch the --link line.

function usage {
    echo ""
    echo "run_stock_mongoexpress.sh script:"
    echo "run the mongo express docker container."
    echo ""
    echo "        ./run_stock_mongoexpress.sh"
    echo ""
}

if [[ "$#" -ne 0 ]];
then

    usage

else

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

fi

# specify the mongo db admin username/password
#        -e ME_CONFIG_MONGODB_ADMINUSERNAME="mongo" \
#        -e ME_CONFIG_MONGODB_ADMINPASSWORD="YouShallNotPass!!!" \

# specify the mongoexpress web interface username/password
#        -e ME_CONFIG_BASICAUTH_USERNAME="mongo" \
#        -e ME_CONFIG_BASICAUTH_PASSWORD="YouShallNotPass!!!" \


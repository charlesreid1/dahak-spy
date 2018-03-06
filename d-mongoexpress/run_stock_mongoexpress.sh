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
        --name angleton \
        -it \
        --rm \
        --link philby:mongo \
        -p 8081:8081 \
        -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
        -e ME_CONFIG_MONGODB_ENABLE_ADMIN="true" \
        -e ME_CONFIG_MONGODB_ADMINUSERNAME="mongo" \
        -e ME_CONFIG_MONGODB_ADMINPASSWORD="YouShallNotPass!!!" \
        -e ME_CONFIG_BASICAUTH_USERNAME="mongo" \
        -e ME_CONFIG_BASICAUTH_PASSWORD="YouShallNotPass!!!" \
        -d \
        mongo-express

fi

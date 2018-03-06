#!/bin/bash
# 
# Run the mongodb docker container
# 
# Traffic via specified port.
# Mount volume being synced, too: mongodb-data 
# 
# http://charlesreid1.com/wiki/Docker/Basics

function usage {
    echo ""
    echo "run_mongodb.sh script:"
    echo "run the mongodb docker container."
    echo ""
    echo "        ./run_mongodb.sh"
    echo ""
}

MONGODIR="${PWD}/mongodb-data"
INTERACTIVE=false
#INTERACTIVE=true
    

if [[ "$#" -ne 0 ]];
then

    usage

else

    if [ "$INTERACTIVE" == true ]; 
    then

        mkdir -p $MONGODIR
    
        docker run \
            --name philby_mongo \
            -p 27017:27017 \
            -v ${MONGODIR}:/data \
            -ti spymongo \
            /bin/bash
    
    else
    
        docker run \
            --name philby_mongo \
            -p 27017:27017 \
            -v ${MONGODIR}:/data \
            -d \
            -ti spymongo 
    
    fi

fi

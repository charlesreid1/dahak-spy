# d-mongodb

Docker library mongo recipe: [link](https://github.com/docker-library/mongo)

Docker hub page: [link](https://hub.docker.com/_/mongo/)

See documentation here: [link](https://github.com/docker-library/docs/tree/master/mongo)

## configure

Because we had so many permissions issues with mounting files 
shared between the host and the container, we opted to put
any configuration options directly on the command line.

## build

no need to build, running will do a docker pull.

## run

```
docker run --name happy_mongo -d mongo
```

## auth

MongoDB does not require authentication by default.

To create an initial user:

```
$ docker exec -it some-mongo mongo admin
connecting to: admin
> db.createUser({ user: 'jsmith', pwd: 'some-initial-password', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
Successfully added user: {
    "user" : "jsmith",
    "roles" : [
        {
            "role" : "userAdminAnyDatabase",
            "db" : "admin"
        }
    ]
}
```

Or, to script it:

```
USER=${MONGODB_USERNAME:-mongo}
PASS=${MONGODB_PASSWORD:-password}
#PASS=${MONGODB_PASSWORD:-$(pwgen -s -1 16)}
DB=${MONGODB_DBNAME:-admin}
if [ ! -z "$MONGODB_DBNAME" ]
then
    ROLE=${MONGODB_ROLE:-dbOwner}
else
    ROLE=${MONGODB_ROLE:-dbAdminAnyDatabase}
fi

# Start MongoDB service
/usr/bin/mongod --dbpath /data --nojournal &
while ! nc -vz localhost 27017; do sleep 1; done

# Create User
echo "Creating user: \"$USER\"... password: \"$PASS\""
/usr/bin/mongo $DB --eval "db.createUser({ user: '$USER', pwd: '$PASS', roles: [ { role: '$ROLE', db: '$DB' } ] });"

# Stop MongoDB service
/usr/bin/mongod --dbpath /data --shutdown

# Start MongoDB service
/usr/bin/mongod --conf /etc/mongod.conf --dbpath /data 
```

Then connect container externally as follows:

```
$ docker run -it --rm --link happy_mongo:mongo mongo \
	mongo -u jsmith -p some-initial-password --authenticationDatabase admin \
	some-mongo/some-db
```


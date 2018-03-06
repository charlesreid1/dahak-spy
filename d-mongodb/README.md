# MongoDB Docker Service

This Dockerfile allows for running MongoDB in a Docker container.

## Usage

To build:

```
$ ./build_mongodb.sh
```

To run:

```
$ ./run_mongodb.sh
```

To change the IP address that MongoDB is bound to, you have two options:
* Bind to the IP address at the Docker level 
* Bind to the IP address at the MongoDB level

To bind at the Docker level, modify the `docker run` command's `-p` flag.
Change this:

```
-p 27017:27017
```

to this:

```
-p <host-bind-ip-addr>:27017:27017
```

For example, if the MongoDB server is on a private subnet with IP address
10.6.0.2, the flag would be:

```
-p 10.6.0.2:27017:27017
```

To bind at the MongoDB level, edit the MongoDB config file `mongod.conf`
and change the following section:

```
net:
   bindIp: 127.0.0.1
   port: 27017
```

(If you change the port, you must also update the Dockerfile and the 
`docker run` command.)

## Info

Data:
* MongoDB docker file mounts the local host directory `./mongodb-data/` to the container directory `/data/`

Config:
* The `mongod.conf` configuration file is used to configure MongoDB
* This configuration file is copied into the container at `/etc/mongod.conf`

Ports:
* By default, MongoDB listens internally on port 27017
* Container's port 27017 is mapped to host's port 27017
* To change the port, change it at the Docker level by editing the docker run command, or at the MongoDB level by changing the MongoDB configuration file

Networking:
* By default, MongoDB binds to 127.0.0.1 and will only listen for local requests
* To have MongoDB listen on the network, use the config file to bind it to a particular interface


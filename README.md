# dahak-spy

This repo contains files for setting up a monitoring/logging node.

The services are run through Docker, so Dockerfiles are provided,
along with build and run scripts.

## Databases

### Prometheus

### MongoDB and MongoExpress

MongoDB is a NoSQL database that is ideal for unstructured data.
There is a natural mapping between NoSQL documents (the NoSQL equivalent
of SQL records) and Python dictionaries.

MongoDB binds to port 27017.

MongoExpress provides 



Services:

* MongoDB
* MongoExpress
* ZMQ
* Grafana

Intended use: instrument any nodes running the dahak workflow,
anad send the data to this dahak-spy node.


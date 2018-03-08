# dahak-spy

This repo contains files for setting up a node for monitoring and logging
data from nodes working on dahak workflows.

## Screenshots

Netdata running on the yeti node @ 10.11.0.194 (yeti is a beefy node running the dahak pipeline):

![dahak-yeti netdata instance](https://i.imgur.com/DGMdAZz.png)

Netdata running on the spy node @ 10.11.0.192 (spy is monitoring itself as well as yeti nodes):

![dahak-spy netdata instance](https://i.imgur.com/ECoGLFN.png)

## Services

Services are run through Docker. Dockerfiles and/or run and build scripts provided.

Database services:

* MongoDB + MongoExpress (general purpose)
* Prometheus (collects data from netdata endpoints)

Metrics, Monitoring, and Dashboards:

* Netdata (this is run both on spy and on the nodes that spy is monitoring)
* Grafana (visualizes data in Prometheus database)

Messaging services:

* ZeroMQ (a.k.a. zmq) (general purpose)

<br />

## Databases:

### MongoDB

Port: `27017`

Link: [MongoDB](https://www.mongodb.com/)

Description: MongoDB is a NoSQL database. It is loose with syntax, accepts unstructured data, and is easy to get going. It is consistent with a philosophy of lowering barriers to collecting data.

#### MongoExpress

Port: `8081`

Link: [MongoExpress](https://github.com/mongo-express/mongo-express)

Description: MongoExpress is an extremely useful web interface for MongoDB. It further lowers the barrier to collecting data.

<br />

## Metrics, Monitoring, Dashboards:

### Netdata

Port: `19999`

Link: [Netdata](https://github.com/firehol/netdata)

Netdata is a service that will collect metrics from compute instances.
Data is available through an API endpoint and is collected by Prometheus.

### Grafana

Port: `3000` (or [specified by user](http://docs.grafana.org/installation/configuration/#http-port))

Link: [Grafana](https://grafana.com/)

Grafana is a tool for creating dashboard visualizations. 
Grafana connects to Prometheus on the backend and visualizes
data contained in the Prometheus database.

<br />

## Messaging:

### ZeroMQ (ZMQ)

Port: `<specified by user>`

Link: [ZeroMQ](http://zeromq.org/)

Description: ZeroMQ is a messaging queue with a client-server pub-sub architecture. Clients can either publish (write) to a channel, or subscribe to (read) a channel. ZMQ separates the process of publishing data and storing it. This allows for publishers to publish to a channel without regard to what will ultimately be done with the data by the subscribers (and to easily share data with multiple subscribers). For example, if a publisher publishes 3 messages per second, but data is only needed at a 10-second resolution, or we want to report a rolling average, the messages can be collected and filtered as needed.


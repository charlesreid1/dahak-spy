# dahak-spy

Dotfiles and setup for a monitoring node.

Services:

* MongoDB
* MongoExpress
* ZMQ
* Grafana

Intended use: instrument any nodes running the dahak workflow,
anad send the data to this dahak-spy node.

## MongoDB

Port: `27017`

Link: [MongoDB](https://www.mongodb.com/)

Description: MongoDB is a NoSQL database. It is loose with syntax, accepts unstructured data, and is easy to get going. It is consistent with a philosophy of lowering barriers to collecting data.

## MongoExpress

Port: `8081`

Link: [MongoExpress](https://github.com/mongo-express/mongo-express)

Description: MongoExpress is an extremely useful web interface for MongoDB. It further lowers the barrier to collecting data.

## ZeroMQ (ZMQ)

Port: `<specified by user>`

Link: [ZeroMQ](http://zeromq.org/)

Description: ZeroMQ is a messaging queue with a client-server pub-sub architecture. Clients can either publish (write) to a channel, or subscribe to (read) a channel. ZMQ separates the process of publishing data and storing it. This allows for publishers to publish to a channel without regard to what will ultimately be done with the data by the subscribers (and to easily share data with multiple subscribers). For example, if a publisher publishes 3 messages per second, but data is only needed at a 10-second resolution, or we want to report a rolling average, the messages can be collected and filtered as needed.

## Grafana

Port: `3000` (or [specified by user](http://docs.grafana.org/installation/configuration/#http-port))

Link: [Grafana](https://grafana.com/)


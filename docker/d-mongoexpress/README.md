# d-mongoexpress

## build

No need to build, docker will pull any container it does not have on run.

## run

Just run the script:

```
./run_stock_mongoexpress.sh
```

## auth

The run script contains two username/password
specifications (left out by default), set by
passing in environmental variables:

mongodb admin username and password:

```
         -e ME_CONFIG_MONGODB_ADMINUSERNAME="mongo" \
         -e ME_CONFIG_MONGODB_ADMINPASSWORD="<your-mongo-password>" \
```

mongo express username and password:

```
         -e ME_CONFIG_BASICAUTH_USERNAME="mongoexpress" \
         -e ME_CONFIG_BASICAUTH_PASSWORD="<your-mongoexpress-password>" \
```

The first is set by MongoDB and is needed to access
any databases. The second is a username/password
authentication layer on the MongoExpress web interface
and does not have anything to do with MongoDB.


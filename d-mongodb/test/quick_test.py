from pymongo import MongoClient
client = MongoClient('10.6.0.1', 27017)
db = client.test_database
print(db.collection_names())

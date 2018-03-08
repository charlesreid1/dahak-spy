#!/bin/bash
# 
# make a docker volume
# for mongodb stuff,
# since bind-mounting
# causes permissions problems.

# Create data volume
docker volume create philby_mongo_data

# backup/restore data volume 
# https://stackoverflow.com/a/26339848
# 
# backups at the shell level:
# mount the data volume as a folder
# run tar on the entire directory
#
# backups at the db level:
# use MongoDB dump functionality 
# to dump/load database data.


#!/bin/bash
#
# make a prometheus data volume
docker volume create helms_prom_data

# backup/restore data volume:
# - do it yourself in bash
# - mount data volume as a directory
# - run tar on the entire directory

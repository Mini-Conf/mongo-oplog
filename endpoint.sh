#!/bin/sh

# Make sure that database is owned by user mongodb
chown -R mongodb /data/db

# Initialize replicaSet
/init_repl.sh || exit $?



exec su -s /bin/sh -c "exec mongod -smallfiles --oplogSize 128 --storageEngine=wiredTiger --bind_ip_all --replSet rs0" mongodb 

#!/bin/sh

# Initialize replicaSet
/init_repl.sh || exit $?

# Make sure that database is owned by user mongodb
chown -R mongodb /data/db

exec su -s /bin/sh -c "exec mongod -smallfiles --oplogSize 128 --storageEngine=mmapv1 --bind_ip_all --replSet rs0" mongodb 

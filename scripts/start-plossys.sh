#!/bin/bash

hostIp=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | tail -1`
if [ -z "$hostIp" ]; then
  hostIp=`ifconfig en0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
fi
export HOST_IP=$hostIp

docker-compose up -d consul db db2 db3 keycloak
docker-compose exec db mongo mongodb://db:27017 --ssl -sslAllowInvalidCertificates -eval 'rs.initiate(); rs.add("db2"); rs.add("db3")'
sleep 3s
docker-compose up -d $*

echo ">>> Initiate mongodb cluster..."
sleep 5s
docker-compose exec db mongo --ssl -sslAllowInvalidCertificates mongodb://db,db2,db3 --eval 'rs.status()' | sed '0,/server version/d' | grep -A3 name

echo ">>> Checking plossys services..."
sleep 3s
docker-compose logs | grep "Service started" | grep -Eo '^[^ ]+' | xargs -Iservice echo '✅ service'

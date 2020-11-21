#!/bin/bash

#create exchange
curl -i -u guest:guest -H "content-type:application/json" \
    -XPUT -d'{"type":"direct","durable":true}' \
    http://localhost:15672/api/exchanges/%2F/outbox-accounts

#create queue
curl -i -u guest:guest -H "content-type:application/json" \
    -XPUT -d'{"durable":true}' \
    http://localhost:15672/api/queues/%2F/outbox-accounts

#bind
curl -i -u guest:guest -H "content-type:application/json" \
    -XPOST -d'{"routing_key":"rkey1"}' \
    http://localhost:15672/api/bindings/%2F/e/outbox-accounts/q/outbox-accounts


#add a sink connector
curl -s -X POST -H 'Content-Type: application/json' --data @scripts/rabbit-sink-connector.json http://localhost:8083/connectors
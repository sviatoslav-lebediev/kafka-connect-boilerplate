#!/bin/bash

# required additional db configuration
# https://debezium.io/documentation/reference/1.3/connectors/mysql.html#enable-the-mysql-binlog-for-cdc_debezium

# curl -i -X PUT -H  "Content-Type:application/json" \
#     http://localhost:8083/connectors/source-debezium-accounts-00/config \
#     -d '{
#             "connector.class": "io.debezium.connector.mysql.MySqlConnector",
#             "database.hostname": "mysql",
#             "database.port": "3306",
#             "database.user": "connect_user",
#             "database.password": "asgard",
#             "database.server.id": "42",
#             "database.server.name": "asgard",
#             "table.whitelist": "demo.accounts",
#             "database.history.kafka.bootstrap.servers": "kafka:29092",
#             "database.history.kafka.topic": "dbhistory.demo" ,
#             "decimal.handling.mode": "double",
#             "include.schema.changes": "true",
#             "transforms": "unwrap,addTopicPrefix",
#             "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
#             "transforms.addTopicPrefix.type":"org.apache.kafka.connect.transforms.RegexRouter",
#             "transforms.addTopicPrefix.regex":"(.*)",
#             "transforms.addTopicPrefix.replacement":"mysql-debezium-$1"
#     }'
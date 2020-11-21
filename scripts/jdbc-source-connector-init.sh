#!/bin/bash

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
    "name": "jdbc_source_mysql_203",
    "config": {
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:mysql://mysql:3306/demo",
            "connection.user": "connect_user",
            "connection.password": "asgard",
            "topic.prefix": "outbox-",
            "mode":"timestamp",
            "table.whitelist" : "demo.accounts",
            "timestamp.column.name": "UPDATE_TS",
            "validate.non.null": false
            }
    }'
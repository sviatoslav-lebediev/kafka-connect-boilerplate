# How to start

* run `docker-compose up`. We run a mariadb on the 3306 port so if you have another container using this port stop it before running this command.

* After all containes are up run `./scripts/jdbc-source-connector-init.sh`. it will add a kafka topic for the `accounts` table, topic name is `outbox-accounts`.

* If you want to pipe data from the kafka `outbox-accounts` topic to a rabbitmq queue you need to run `./scripts/rabbitmq-init-sink-connector.sh`. It will create the required exchange and queue.

* For mysql connection you can use `docker exec --tty --interactive mysql bash -c 'mysql -u root -pAdmin123'`

* debezium connector requires additional db tunning. More info in `./scripts/debezium-source-connector-init.sh`

* `src` folder contains 3 files
  1. producer.js - simple data producer which inserts data to the accounts table
  2. consumer-kafka.js - listens to the kafka `outbox-accounts`
  3. consumer-rabbitmq.js - listens to the rabbitmq queue `outbox-accounts`

Consumers can be run in parallel

If you need to remove a connector

```bash
curl -X DELETE http://localhost:8083/connectors/<connector-name>
```

If you need to start from the scratch

```bash
docker-compose down -v  --remove-orphans
```

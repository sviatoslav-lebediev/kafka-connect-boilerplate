const { inspect } = require('util');
const { Consumer, KafkaClient } = require('kafka-node');
const client = new KafkaClient({
    kafkaHost: 'localhost:9092',
});

const consumer = new Consumer(client, [{ topic: 'outbox-accounts', partition: 0 }], {
    autoCommit: true,
    groupId: 'accounts-reader',
});

consumer.on('message', (message) => {
    const value = JSON.parse(message.value.toString());

    console.log('kafka message', inspect(value.payload, false, 5, true));
});

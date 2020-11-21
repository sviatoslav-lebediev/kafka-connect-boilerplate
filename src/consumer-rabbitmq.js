const amqp = require('amqplib');

(async () => {
    const connection = await amqp.connect('amqp://localhost:5672');
    const channel = await connection.createChannel();

    channel.consume(
        'outbox-accounts',
        (message) => {
            const { payload } = JSON.parse(message.content.toString());

            console.log('rabbit message', payload);
        },
        { noAck: true }
    );
})();

const faker = require('faker');
const { createConnection } = require('mysql');
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

const INSERT = 'insert into demo.accounts (first_name, last_name, username, company) values (?, ?, ?, ?);';

const generateItem = () => [faker.name.firstName(), faker.name.lastName(), faker.internet.userName(), faker.company.companyName()];

const prompt = () => console.log("How many items ? Enter number and hit 'enter'");

(async () => {
    const pool = createConnection({
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'Admin123',
    });

    prompt();

    rl.on('line', (input) => {
        let count = parseInt(input, 10);
        let inserted = count;

        while (count--) {
            const values = generateItem();

            pool.query({ sql: INSERT, values }, (error, result) => {
                inserted--;
                if (error) {
                    console.error(error);
                } else {
                    console.log(`inserted item id ${result.insertId}, user name - ${values[2]}`);
                }

                if (inserted === 0) {
                    prompt();
                }
            });
        }
    });
})();

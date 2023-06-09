const mariadb = require('mariadb');
const pool = mariadb.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    connectionLimit: 5
    //host: '10.1.1.12',
    //user: 'signuser',
    //password: 'pwdsignuser',
    //database: 'signature',
    //connectionLimit: 5

});

//log pour verif console lancement de l app
console.log({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    connectionLimit: 5
})

//connect and check for errors
pool.getConnection((err, connection) => {
    if(err) {
        if(err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('Database connection lost');
        }
        if(err.code === 'ER_CON_COUNT_ERROR') {
            console.error('Database has too many connection');
        }
        if(err.code === 'ECONNREFUSED') {
            console.error('Database connection was refused');
        }
    }
    if(connection) connection.release();

    return;
});

module.exports = pool;
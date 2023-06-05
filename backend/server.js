//constantes
const express = require('express');
const bodyPaser = require('body-parser');

const app = express();
const PORT = 3000;

//utilisations
app.use(express.json());
app.use(bodyPaser.urlencoded({extended:false}));

app.use('/', (req, res, next) => {
    res.send(`<h1>Server du projet Signature sur le port ${PORT}</h1>`)
    return;
})

//ecoute du port
app.listen(PORT, () =>
    console.log(`server started on port ${PORT}`)
);
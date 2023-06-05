//constantes
const express = require('express');
const bodyPaser = require('body-parser');

const routes = require('./src/routes/signRoutes');

//autres constantes
const app = express();
const PORT = 3000;

//passage des routes
routes(app);

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
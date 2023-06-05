//constantes
const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

//fichier de route
const routes = require('./src/routes/signRoutes');
//fichier variable d env
dotenv.config({ path: '.env-local' });

//autres constantes
const PORT = process.env.PORT || '3001';
const app = express();

//passage des routes
routes(app);

//middleware
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use('/', (req, res, next) => {
    res.status(200).json({ serverPort: `${PORT}`, status: 'running' });
    return;
    //res.send(`<h1>Server du projet Signature sur le port ${PORT}</h1>`)
})

//ecoute du port
app.listen(PORT, () =>
    console.log(`server started on port ${PORT}`)
);
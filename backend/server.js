//constantes
const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

//fichier de route
const etudiantRoutes = require('./src/routes/etudiantRoutes');
const intervenantRoutes = require('./src/routes/intervenantRoutes');
const attachePromRoutes = require('./src/routes/attachePromRoutes');
const responsablePedaRoutes = require('./src/routes/responsablePedaRoutes');
const directionRoutes = require('./src/routes/directionRoutes');


//fichier variable d env
dotenv.config({ path: './.local-env' });

//autres constantes
const PORT = process.env.PORT || '3001';
const app = express();

//middleware
app.use(express.json());
app.use(bodyParser.json());

//passage des routes
//signRoutes(app);
//app.use('/', signRoutes);
app.use('/etudiant', etudiantRoutes);
app.use('/intervenant', intervenantRoutes);
app.use('/attacheProm', attachePromRoutes);
app.use('/responsablePeda', responsablePedaRoutes);
app.use('/direction', directionRoutes);

app.use('/', (req, res, next) => {
    res.status(200).json({ serverPort: `${PORT}`, status: 'running' });
    return;
    //res.send(`<h1>Server du projet Signature sur le port ${PORT}</h1>`)
})

//ecoute du port
app.listen(PORT, () =>
    console.log(`server started on port ${PORT}`)
);
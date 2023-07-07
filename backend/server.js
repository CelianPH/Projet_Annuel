//constantes
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

//fichier de route
const etudiantRoutes = require('./src/routes/etudiantRoutes');
const intervenantRoutes = require('./src/routes/intervenantRoutes');
const attachePromRoutes = require('./src/routes/attachePromRoutes');
const responsablePedaRoutes = require('./src/routes/responsablePedaRoutes');
const directionRoutes = require('./src/routes/directionRoutes');
const ecoleRoutes = require('./src/routes/ecoleRoutes');
const creneauRoutes = require('./src/routes/creneauRoutes');
const droitRoutes = require('./src/routes/droitRoutes');
const matiereRoutes = require('./src/routes/matiereRoutes');
const postbacRoutes = require('./src/routes/postbacRoutes');
const promotionRoutes = require('./src/routes/promotionRoutes');
const roleRoutes = require('./src/routes/roleRoutes');
const salleRoutes = require('./src/routes/salleRoutes');
const specialiteRoutes = require('./src/routes/specialiteRoutes');
const typeSalleRoutes = require('./src/routes/typeSalleRoutes');


//fichier variable d env
dotenv.config({ path: './.local-env' });

//autres constantes
const PORT = process.env.PORT || '3001';
const app = express();

//middleware
app.use(express.json());
app.use(bodyParser.json());
app.use(cors());

//passage des routes
//signRoutes(app);
//app.use('/', signRoutes);
app.use('/etudiant', etudiantRoutes);
app.use('/intervenant', intervenantRoutes);
app.use('/attacheProm', attachePromRoutes);
app.use('/responsablePeda', responsablePedaRoutes);
app.use('/direction', directionRoutes);
app.use('/ecole', ecoleRoutes);
app.use('/creneau', creneauRoutes);
app.use('/droit', droitRoutes);
app.use('/matiere', matiereRoutes);
app.use('/postbac', postbacRoutes);
app.use('/promotion', promotionRoutes);
app.use('/role', roleRoutes);
app.use('/salle', salleRoutes);
app.use('/specialite', specialiteRoutes);
app.use('/typeSalle', typeSalleRoutes);

app.use('/', (req, res, next) => {
    res.status(200).json({ serverPort: `${PORT}`, status: 'running' });
    return;
    //res.send(`<h1>Server du projet Signature sur le port ${PORT}</h1>`)
})

//ecoute du port
app.listen(PORT, () =>
    console.log(`server started on port ${PORT}`)
);
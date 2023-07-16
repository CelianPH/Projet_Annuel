const express = require('express');
const connexionRoutes = express.Router();
const pool = require('../../helpers/dbConfig');

connexionRoutes.get('/:mail', async function(req, res) {
    try {
        const sqlQuery = 'SELECT mail, chp_motPasSe_CY, code_utilisateur FROM signature.utilisateur WHERE mail=?'
        const rows = await pool.query(sqlQuery, req.params.mail)
        
        if (rows.length > 0) {
            res.status(200).json(rows);
        } else {
            res.status(404).json({ message: 'Aucun utilisateur trouvé avec cet email' });
        }
    } catch (error) {
        res.status(400).send(error.message)
    }

});

module.exports = connexionRoutes;
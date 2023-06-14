const express = require('express');
const userRoutes = express.Router();
const pool = require('../../helpers/dbConfig');

userRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail FROM signature.utilisateur WHERE code_utilisateur=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

    res.status(200).json({id:req.params.id})
})

module.exports = userRoutes;
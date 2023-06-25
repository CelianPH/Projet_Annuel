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

userRoutes.post('/', async function(req, res) {
    try {
      const { nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, adm_service, int_societe, code_role, code_droit, code_promotion, code_ecole } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.utilisateur (nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, adm_service, int_societe, code_role, code_droit, code_promotion, code_ecole) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, adm_service, int_societe, code_role, code_droit, code_promotion, code_ecole]);
  
      res.status(200).json({ message: 'Utilisateur ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }

    res.status(200).json({id:req.params.id})
  });
  

module.exports = userRoutes;
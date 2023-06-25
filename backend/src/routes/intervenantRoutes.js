const express = require('express');
const intervenantRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir les infos etudiant par son id
intervenantRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, int_societe FROM signature.utilisateur WHERE code_utilisateur=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

    res.status(200).json({id:req.params.id})
});

//ajouter un intervenant
intervenantRoutes.post('/', async function(req, res) {
    try {
      const { nom, prenom, mail, chp_motPasSe_CY, int_societe } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.utilisateur (nom, prenom, mail, chp_motPasSe_CY, int_societe, code_role, code_droit) VALUES (?, ?, ?, ?, ?, 3, 2)';
  
      const result = await pool.query(sqlQuery, [nom, prenom, mail, chp_motPasSe_CY, int_societe]);
  
      res.status(200).json({ message: 'Intervenant ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos etudiant par son id
intervenantRoutes.put('/:id', async function(req, res) {
    try {
        const code_utilisateur = req.params.id;
        const { nom, prenom, mail, chp_motPasSe_CY, int_societe } = req.body;

        // Vérifier si l'utilisateur existe dans la base de données
        const userExists = await pool.query('SELECT * FROM signature.utilisateur WHERE code_utilisateur = ?', code_utilisateur);
        if (userExists.length === 0) {
            return res.status(404).json({ error: "L'intervenant n'existe pas" });
        }

        // Mettre à jour les informations de l'intervenant
        const updateQuery = 'UPDATE signature.utilisateur SET nom = ?, prenom = ?, mail = ?, chp_motPasSe_CY = ?, int_societe = ? WHERE code_utilisateur = ?';
        await pool.query(updateQuery, [nom, prenom, mail, chp_motPasSe_CY, int_societe, code_utilisateur]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un intervenant par son id
intervenantRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.utilisateur WHERE code_utilisateur=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Intervenant supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Intervenant non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = intervenantRoutes;
const express = require('express');
const attachePromRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir les infos attacheProm par son id
attachePromRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, adm_service, code_ecole FROM signature.utilisateur WHERE code_utilisateur=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

    res.status(200).json({id:req.params.id})
});

//ajouter un attacheProm
attachePromRoutes.post('/', async function(req, res) {
    try {
      const { nom, prenom, mail, chp_motPasSe_CY, adm_service, code_ecole } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.utilisateur (nom, prenom, mail, chp_motPasSe_CY, adm_service, code_ecole, code_role, code_droit) VALUES (?, ?, ?, ?, ?, ?, 2, 5)';
  
      const result = await pool.query(sqlQuery, [nom, prenom, mail, chp_motPasSe_CY, adm_service, code_ecole]);
  
      res.status(200).json({ message: 'Attaché de promotion ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos attache de promotion par son id
attachePromRoutes.put('/:id', async function(req, res) {
    try {
        const code_utilisateur = req.params.id;
        const { nom, prenom, mail, chp_motPasSe_CY, adm_service, code_ecole } = req.body;

        // Vérifier si l'utilisateur existe dans la base de données
        const userExists = await pool.query('SELECT * FROM signature.utilisateur WHERE code_utilisateur = ?', code_utilisateur);
        if (userExists.length === 0) {
            return res.status(404).json({ error: "L'attaché de promotion n'existe pas" });
        }

        // Mettre à jour les informations de l'utilisateur
        const updateQuery = 'UPDATE signature.utilisateur SET nom = ?, prenom = ?, mail = ?, chp_motPasSe_CY = ?, adm_service = ?, code_ecole = ? WHERE code_utilisateur = ?';
        await pool.query(updateQuery, [nom, prenom, mail, chp_motPasSe_CY, adm_service, code_ecole, code_utilisateur]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un attache de promotion par son id
attachePromRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.utilisateur WHERE code_utilisateur=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Attaché de promotion supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Attaché de promotion non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = attachePromRoutes;
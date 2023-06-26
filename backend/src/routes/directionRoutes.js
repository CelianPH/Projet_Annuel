const express = require('express');
const directionRoutes = express.Router();
const pool = require('../../helpers/dbConfig');

//obtenir la liste des directeurs
directionRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, adm_service FROM signature.utilisateur WHERE code_droit = 4';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos directeur par son id
directionRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, adm_service FROM signature.utilisateur WHERE code_utilisateur=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

    res.status(200).json({id:req.params.id})
});

//ajouter un directeur
directionRoutes.post('/', async function(req, res) {
    try {
      const { nom, prenom, mail, chp_motPasSe_CY, adm_service } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.utilisateur (nom, prenom, mail, chp_motPasSe_CY, adm_service, code_role, code_droit) VALUES (?, ?, ?, ?, ?, 2, 4)';
  
      const result = await pool.query(sqlQuery, [nom, prenom, mail, chp_motPasSe_CY, adm_service]);
  
      res.status(200).json({ message: 'Directeur ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos directeur par son id
directionRoutes.put('/:id', async function(req, res) {
    try {
        const code_utilisateur = req.params.id;
        const { nom, prenom, mail, chp_motPasSe_CY, adm_service } = req.body;

        // Vérifier si l'utilisateur existe dans la base de données
        const userExists = await pool.query('SELECT * FROM signature.utilisateur WHERE code_utilisateur = ?', code_utilisateur);
        if (userExists.length === 0) {
            return res.status(404).json({ error: "Le directeur n'existe pas" });
        }

        // Mettre à jour les informations de l'utilisateur
        const updateQuery = 'UPDATE signature.utilisateur SET nom = ?, prenom = ?, mail = ?, chp_motPasSe_CY = ?, adm_service = ? WHERE code_utilisateur = ?';
        await pool.query(updateQuery, [nom, prenom, mail, chp_motPasSe_CY, adm_service, code_utilisateur]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un directeur par son id
directionRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.utilisateur WHERE code_utilisateur=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Directeur supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Directeur non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = directionRoutes;
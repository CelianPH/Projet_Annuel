const express = require('express');
const etudiantRoutes = express.Router();
const pool = require('../../helpers/dbConfig');

//obtenir la liste des etudiants
etudiantRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, code_ecole, code_promotion, etu_nb_retard, etu_nb_absence FROM signature.utilisateur WHERE code_role = 1';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos etudiant par son id
etudiantRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, code_ecole, code_promotion, etu_nb_retard, etu_nb_absence FROM signature.utilisateur WHERE code_utilisateur=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

    res.status(200).json({id:req.params.id})
});

//obtenir les etudiants d une ecole par id ecole
etudiantRoutes.get('/ecole/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT code_utilisateur, nom, prenom, mail, code_ecole, code_promotion, etu_nb_retard, etu_nb_absence FROM signature.utilisateur WHERE code_role = 1 AND code_ecole=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

    res.status(200).json({id:req.params.id})
});

//obtenir les etudiants d une promotion
etudiantRoutes.get('/promotion/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.utilisateur WHERE code_role = 1 AND code_promotion = ?';
        const rows = await pool.query(sqlQuery, [req.params.id]);
        res.status(200).json(rows);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

//ajouter un etudiant
etudiantRoutes.post('/', async function(req, res) {
    try {
      const { nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, code_ecole, code_promotion } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.utilisateur (nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, code_ecole, code_promotion, code_role, code_droit) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, 1)';
  
      const result = await pool.query(sqlQuery, [nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, code_ecole, code_promotion]);
  
      res.status(200).json({ message: 'Etudiant ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos etudiant par son id
etudiantRoutes.put('/:id', async function(req, res) {
    try {
        const code_utilisateur = req.params.id;
        const { nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, code_ecole, code_promotion } = req.body;

        // Vérifier si l'utilisateur existe dans la base de données
        const userExists = await pool.query('SELECT * FROM signature.utilisateur WHERE code_utilisateur = ?', code_utilisateur);
        if (userExists.length === 0) {
            return res.status(404).json({ error: "L'étudiant n'existe pas" });
        }

        // Mettre à jour les informations de l'utilisateur
        const updateQuery = 'UPDATE signature.utilisateur SET nom = ?, prenom = ?, mail = ?, chp_motPasSe_CY = ?, etu_nb_retard = ?, etu_nb_absence = ?, code_ecole = ?, code_promotion = ? WHERE code_utilisateur = ?';
        await pool.query(updateQuery, [nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, code_ecole, code_promotion, code_utilisateur]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un etudiant par son id
etudiantRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.utilisateur WHERE code_utilisateur=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Etudiant supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Etudiant non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = etudiantRoutes;
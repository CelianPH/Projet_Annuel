const express = require('express');
const matiereRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des matieres
matiereRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.matiere';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos matiere par son id
matiereRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.matiere WHERE code_matiere = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//obtenir les matieres d une ecole
matiereRoutes.get('/ecole/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.matiere WHERE code_ecole = ?';
        const rows = await pool.query(sqlQuery, [req.params.id]);
        res.status(200).json(rows);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

//obtenir les matieres d un intervenant
matiereRoutes.get('/intervenant/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.matiere WHERE code_utilisateur = ?';
        const rows = await pool.query(sqlQuery, [req.params.id]);
        res.status(200).json(rows);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

//ajouter une matiere
matiereRoutes.post('/', async function(req, res) {
    try {
      const { nom_matiere, code_utilisateur, code_ecole } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.matiere (nom_matiere, code_utilisateur, code_ecole) VALUES (?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [nom_matiere, code_utilisateur, code_ecole]);
  
      res.status(200).json({ message: 'Matière ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos matiere par son id
matiereRoutes.put('/:id', async function(req, res) {
    try {
        const code_matiere = req.params.id;
        const { nom_matiere, code_utilisateur, code_ecole } = req.body;

        // Vérifier si la matiere existe dans la base de données
        const matiereExists = await pool.query('SELECT * FROM signature.matiere WHERE code_matiere = ?', code_matiere);
        if (matiereExists.length === 0) {
            return res.status(404).json({ error: "La matière n'existe pas" });
        }

        // Mettre à jour les informations de la matiere
        const updateQuery = 'UPDATE signature.matiere SET nom_matiere = ?, code_utilisateur = ?, code_ecole = ? WHERE code_matiere = ?';
        await pool.query(updateQuery, [nom_matiere, code_utilisateur, code_ecole, code_matiere]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer une matiere par son id
matiereRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.matiere WHERE code_matiere = ?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Matière supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Matière non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = matiereRoutes;
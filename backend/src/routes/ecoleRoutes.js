const express = require('express');
const ecoleRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des écoles
ecoleRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.ecole';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos ecole par son id
ecoleRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.ecole WHERE code_ecole=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter une ecole
ecoleRoutes.post('/', async function(req, res) {
    try {
      const { nom_ecole, acronyme_ecole, logo_ecole } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.ecole (nom_ecole, acronyme_ecole, logo_ecole) VALUES (?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [nom_ecole, acronyme_ecole, logo_ecole]);
  
      res.status(200).json({ message: 'Ecole ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos ecole par son id
ecoleRoutes.put('/:id', async function(req, res) {
    try {
        const code_ecole = req.params.id;
        const { nom_ecole, acronyme_ecole, logo_ecole} = req.body;

        // Vérifier si l'ecole existe dans la base de données
        const ecoleExists = await pool.query('SELECT * FROM signature.ecole WHERE code_ecole = ?', code_ecole);
        if (ecoleExists.length === 0) {
            return res.status(404).json({ error: "L'école n'existe pas" });
        }

        // Mettre à jour les informations de l'ecoles
        const updateQuery = 'UPDATE signature.ecole SET nom_ecole = ?, acronyme_ecole = ?, logo_ecole = ? WHERE code_ecole = ?';
        await pool.query(updateQuery, [nom_ecole, acronyme_ecole, logo_ecole, code_ecole]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer une ecole par son id
ecoleRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.ecole WHERE code_ecole=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Ecole supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Ecole non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = ecoleRoutes;
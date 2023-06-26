const express = require('express');
const specialiteRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des specialite
specialiteRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.specialite';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos specialite par son id
specialiteRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.specialite WHERE code_specialite = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//obtenir les specialites d une ecole
specialiteRoutes.get('/ecole/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.specialite WHERE code_ecole = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter une specialite
specialiteRoutes.post('/', async function(req, res) {
    try {
      const { nom_specialite, acronyme_specialite, code_ecole } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.specialite (nom_specialite, acronyme_specialite, code_ecole) VALUES (?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [nom_specialite, acronyme_specialite, code_ecole]);
  
      res.status(200).json({ message: 'Spécialité ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos specialite par son id
specialiteRoutes.put('/:id', async function(req, res) {
    try {
        const code_specialite = req.params.id;
        const { nom_specialite, acronyme_specialite, code_ecole} = req.body;

        // Vérifier si la specialite existe dans la base de données
        const specialiteExists = await pool.query('SELECT * FROM signature.specialite WHERE code_specialite = ?', code_specialite);
        if (specialiteExists.length === 0) {
            return res.status(404).json({ error: "La Spécialité n'existe pas" });
        }

        // Mettre à jour les informations de la specialite
        const updateQuery = 'UPDATE signature.specialite SET nom_specialite = ?, acronyme_specialite = ?, code_ecole = ? WHERE code_specialite = ?';
        await pool.query(updateQuery, [nom_specialite, acronyme_specialite, code_ecole, code_specialite]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer une specialite par son id
specialiteRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.specialite WHERE code_specialite=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Spécialité supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Spécialité non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = specialiteRoutes;
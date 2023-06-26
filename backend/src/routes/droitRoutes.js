const express = require('express');
const droitRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des droits
droitRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.droit';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos droit par son id
droitRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.droit WHERE code_droit = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter un droit
droitRoutes.post('/', async function(req, res) {
    try {
      const { desc_droit } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.droit (desc_droit) VALUES (?)';
  
      const result = await pool.query(sqlQuery, [desc_droit]);
  
      res.status(200).json({ message: 'Niveau de droit ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier un droit par son id
droitRoutes.put('/:id', async function(req, res) {
    try {
        const code_droit = req.params.id;
        const {desc_droit} = req.body;

        // Vérifier si le droit existe dans la base de données
        const droitExists = await pool.query('SELECT * FROM signature.droit WHERE code_droit= ?', code_droit);
        if (droitExists.length === 0) {
            return res.status(404).json({ error: "Le niveau de droit n'existe pas" });
        }

        // Mettre à jour les informations de droit
        const updateQuery = 'UPDATE signature.droit SET desc_droit = ? WHERE code_droit = ?';
        await pool.query(updateQuery, [desc_droit, code_droit]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un droit par son id
droitRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.droit WHERE code_droit = ?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Niveau de droit supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Niveau de droit non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = droitRoutes;
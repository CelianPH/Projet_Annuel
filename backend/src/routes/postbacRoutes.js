const express = require('express');
const postbacRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste annee
postbacRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.post_bac';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir l annee par son id
postbacRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.post_bac WHERE niveau = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter une annee
postbacRoutes.post('/', async function(req, res) {
    try {
      const { niveau } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.post_bac (niveau) VALUES (?)';
  
      const result = await pool.query(sqlQuery, [niveau]);
  
      res.status(200).json({ message: 'Niveau post bac ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//supprimer un annee par son id
postbacRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.post_bac WHERE niveau = ?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Niveau post bac supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Niveau post bac non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = postbacRoutes;
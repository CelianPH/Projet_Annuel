const express = require('express');
const creneauRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des creneaux de cours
creneauRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.creneau';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos ecole par son id
creneauRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.creneau WHERE code_creneau=?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter un creneau
creneauRoutes.post('/', async function(req, res) {
    try {
      const { desc_creneau } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.creneau (desc_creneau) VALUES (?)';
  
      const result = await pool.query(sqlQuery, [desc_creneau]);
  
      res.status(200).json({ message: 'Créneau de cours ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier un creneau par son id
creneauRoutes.put('/:id', async function(req, res) {
    try {
        const code_creneau = req.params.id;
        const { desc_creneau} = req.body;

        // Vérifier si le creneau existe dans la base de données
        const creneauExists = await pool.query('SELECT * FROM signature.creneau WHERE code_creneau= ?', code_creneau);
        if (creneauExists.length === 0) {
            return res.status(404).json({ error: "Le créneau de cours n'existe pas" });
        }

        // Mettre à jour les informations de l'utilisateur
        const updateQuery = 'UPDATE signature.creneau SET desc_creneau = ? WHERE code_creneau = ?';
        await pool.query(updateQuery, [desc_creneau, code_creneau]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un creneau par son id
creneauRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.creneau WHERE code_creneau=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Créneau de cours supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Créneau de cours non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = creneauRoutes;
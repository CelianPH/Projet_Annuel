const express = require('express');
const typeSalleRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des type de salles
typeSalleRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.type_salle';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos type salle par son id
typeSalleRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.type_salle WHERE num_type = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter un type de salle
typeSalleRoutes.post('/', async function(req, res) {
    try {
      const { num_type, desc_type } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.type_salle (num_type, desc_type) VALUES (?, ?)';
  
      const result = await pool.query(sqlQuery, [num_type, desc_type]);
  
      res.status(200).json({ message: 'Type de salle ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos d un type de salle par son id
typeSalleRoutes.put('/:id', async function(req, res) {
    try {
        const num_type = req.params.id;
        const { desc_type } = req.body;

        // Vérifier si le type de salle existe dans la base de données
        const typeExists = await pool.query('SELECT * FROM signature.type_salle WHERE num_type = ?', num_type);
        if (typeExists.length === 0) {
            return res.status(404).json({ error: "Le type de salle n'existe pas" });
        }

        // Mettre à jour les informations du type de salle
        const updateQuery = 'UPDATE signature.type_salle SET desc_type = ? WHERE num_type = ?';
        await pool.query(updateQuery, [desc_type, num_type]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un type de salle par son id
typeSalleRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.type_salle WHERE num_type = ?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Type de salle supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Type de salle non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = typeSalleRoutes;
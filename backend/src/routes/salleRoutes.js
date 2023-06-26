const express = require('express');
const salleRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des salles
salleRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.salle';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos salle par son id
salleRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.salle WHERE code_salle = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//obtenir les salle d un etage
salleRoutes.get('/etage/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.salle WHERE etage = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//obtenir les salle d un type
salleRoutes.get('/type/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.salle WHERE num_type = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter une salle
salleRoutes.post('/', async function(req, res) {
    try {
      const { num_salle, etage, num_type } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.salle (num_salle, etage, num_type) VALUES (?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [num_salle, etage, num_type]);
  
      res.status(200).json({ message: 'Salle ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos salle par son id
salleRoutes.put('/:id', async function(req, res) {
    try {
        const num_salle = req.params.id;
        const { etage, num_type} = req.body;

        // Vérifier si la salle existe dans la base de données
        const salleExists = await pool.query('SELECT * FROM signature.salle WHERE num_salle = ?', num_salle);
        if (salleExists.length === 0) {
            return res.status(404).json({ error: "La salle n'existe pas" });
        }

        // Mettre à jour les informations de la salle
        const updateQuery = 'UPDATE signature.salle SET etage = ?, num_type = ? WHERE num_salle = ?';
        await pool.query(updateQuery, [etage, num_type, num_salle]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer une salle par son id
salleRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.salle WHERE num_salle=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Salle supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Salle non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = salleRoutes;
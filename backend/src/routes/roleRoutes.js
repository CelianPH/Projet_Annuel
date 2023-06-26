const express = require('express');
const roleRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des roles
roleRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.role_utilisateur';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos role par son id
roleRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.role_utilisateur WHERE code_role = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter un role
roleRoutes.post('/', async function(req, res) {
    try {
      const { nom_role } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.role_utilisateur (nom_role) VALUES (?)';
  
      const result = await pool.query(sqlQuery, [nom_role]);
  
      res.status(200).json({ message: 'Rôle utilisateur ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier un role par son id
roleRoutes.put('/:id', async function(req, res) {
    try {
        const code_role = req.params.id;
        const {nom_role} = req.body;

        // Vérifier si le role existe dans la base de données
        const roleExists = await pool.query('SELECT * FROM signature.role_utilisateur WHERE code_role = ?', code_role);
        if (roleExists.length === 0) {
            return res.status(404).json({ error: "Le rôle utilisateur n'existe pas" });
        }

        // Mettre à jour les informations de role
        const updateQuery = 'UPDATE signature.role_utilisateur SET nom_role = ? WHERE code_role = ?';
        await pool.query(updateQuery, [nom_role, code_role]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer un role par son id
roleRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.role_utilisateur WHERE code_role = ?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Rôle utilisateur supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Rôle utilisateur non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = roleRoutes;
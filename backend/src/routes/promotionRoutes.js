const express = require('express');
const promotionRoutes = express.Router();
const pool = require('../../helpers/dbConfig');


//obtenir la liste des promotions
promotionRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.promotion';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//obtenir les infos promotion par son id
promotionRoutes.get('/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.promotion WHERE code_promotion = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//obtenir les promotions d une ecole
promotionRoutes.get('/ecole/:id', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.promotion WHERE code_ecole = ?'
        const rows = await pool.query(sqlQuery, req.params.id)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }
    
    res.status(200).json({id:req.params.id})
});

//ajouter une promotion
promotionRoutes.post('/', async function(req, res) {
    try {
      const { nom_promotion, code_ecole, code_specialite, niveau } = req.body;
  
      const sqlQuery = 'INSERT INTO signature.promotion (nom_promotion, code_ecole, code_specialite, niveau) VALUES (?, ?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [nom_promotion, code_ecole, code_specialite, niveau]);
  
      res.status(200).json({ message: 'Promotion ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos promotion par son id
promotionRoutes.put('/:id', async function(req, res) {
    try {
        const code_promotion = req.params.id;
        const { nom_promotion, code_ecole, code_specialite, niveau } = req.body;

        // Vérifier si la promo existe dans la base de données
        const promoExists = await pool.query('SELECT * FROM signature.promotion WHERE code_promotion = ?', code_promotion);
        if (promoExists.length === 0) {
            return res.status(404).json({ error: "La promotion n'existe pas" });
        }

        // Mettre à jour les informations de la promo
        const updateQuery = 'UPDATE signature.promotion SET nom_promotion = ?, code_ecole = ?, code_specialite = ?, niveau = ? WHERE code_promotion = ?';
        await pool.query(updateQuery, [nom_promotion, code_ecole, code_specialite, niveau, code_promotion]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//supprimer une promo par son id
promotionRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.promotion WHERE code_promotion = ?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Promotion supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Promotion non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});



module.exports = promotionRoutes;
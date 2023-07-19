const express = require('express');
const coursRoutes = express.Router();
const pool = require('../../helpers/dbConfig');

//liste des cours
coursRoutes.get('/', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.cours';
        const rows = await pool.query(sqlQuery);
            
         res.status(200).json(rows);
        } catch (error) {
            res.status(400).send(error.message);
        }
});

//liste des cours d une promotion
coursRoutes.get('/:promotion', async function(req, res) {
    try {
        const sqlQuery = 'SELECT * FROM signature.cours WHERE code_promotion=?'
        const rows = await pool.query(sqlQuery, req.params.promotion)
        res.status(200).json(rows);
        return;
    } catch (error) {
        res.status(400).send(error.message)
    }

});

//afficher un cours pour le calendrier
coursRoutes.get('/:promotion/:date/:creneau', async function (req, res) {
    try {
      const date = decodeURIComponent(req.params.date);
      const promotion = req.params.promotion;
      const creneau = req.params.creneau;
  
      // Vérifier si la date est valide
      if (!isValidDate(date)) {
        return res.status(400).json({ error: 'Date invalide' });
      }
  
      const sqlQuery = 'SELECT * FROM signature.cours WHERE code_promotion=? AND date_cours=? AND code_creneau=2';
      const rows = await pool.query(sqlQuery, [promotion, date, creneau]);
      res.status(200).json(rows);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  });
  
  // Fonction pour vérifier si la date est valide
  function isValidDate(dateString) {
    const dateRegex = /^\d{4}-\d{2}-\d{2}$/;
    return dateRegex.test(dateString) && !isNaN(Date.parse(dateString));
  }
  
  


//ajouter un cours
coursRoutes.post('/', async function(req, res) {
    try {
      const { date_cours, code_creneau, code_promotion, num_salle, code_matiere } = req.body; 
  
      const sqlQuery = 'INSERT INTO signature.cours (date_cours, code_creneau, code_promotion, num_salle, code_matiere) VALUES (?, ?, ?, ?, ?)';
  
      const result = await pool.query(sqlQuery, [date_cours, code_creneau, code_promotion, num_salle, code_matiere]);
  
      res.status(200).json({ message: 'Cours ajouté avec succès' });
    } catch (error) {
      res.status(400).send(error.message);
    }
});

//modifier les infos de cours
coursRoutes.put('/:id', async function(req, res) {
    try {
        const code_cours = req.params.id;
        const { date_cours, code_creneau, code_promotion, num_salle, code_matiere } = req.body;

        // Vérifier si le cours existe dans la base de données
        const courseExists = await pool.query('SELECT * FROM signature.cours WHERE code_cours = ?', [code_cours]);
        if (courseExists.length === 0) {
            return res.status(404).json({ error: "Le cours n'existe pas" });
        }

        // Mettre à jour les informations de cours
        const updateQuery = 'UPDATE signature.cours SET date_cours =?, code_creneau =?, code_promotion =?, num_salle =?, code_matiere =? WHERE code_cours = ?';
        await pool.query(updateQuery, [date_cours, code_creneau, code_promotion, num_salle, code_matiere, code_cours]);

        res.status(200).json({ success: true });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});


//supprimer un intervenant par son id
coursRoutes.delete('/:id', async function(req, res) {
    try {
        const sqlQuery = 'DELETE FROM signature.cours WHERE code_cours=?';
        const result = await pool.query(sqlQuery, req.params.id);
        
        if (result.affectedRows > 0) {
            res.status(200).json({ message: 'Cours supprimé avec succès' });
        } else {
            res.status(404).json({ message: 'Cours non trouvé' });
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
});

module.exports = coursRoutes;
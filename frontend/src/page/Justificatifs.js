import React, { useState } from "react";
import "../css/Justificatifs.css";

const AbsenceTable = ({ absences, title, onDelete, tableWidth }) => {
  const [expanded, setExpanded] = useState(false);

  const ouvrirPopup = (justificatif) => {
    // Code pour ouvrir la pop-up et afficher le justificatif
    console.log(`Justificatif : ${justificatif}`);
  };

  const handleDelete = (id) => {
    // Appeler la fonction onDelete pour supprimer l'absence avec l'id donné
    onDelete(id);
  };

  const displayRows = expanded ? absences.length : absences.length <= 5 ? absences.length : 5;

  return (
    <div className="table-cadre" style={{ width: `${tableWidth}px` }}>
      <h3>{title}</h3>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Heure</th>
            <th>Cours</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {absences.slice(0, displayRows).map((absence) => (
            <tr key={absence.id}>
              <td>{absence.id}</td>
              <td>{absence.date}</td>
              <td>{absence.heure}</td>
              <td>{absence.cours}</td>
              <td>
                <button onClick={() => ouvrirPopup('Justificatif en attente')}>
                  Voir justificatif
                </button>
                <button onClick={() => handleDelete(absence.id)}>
                  Supprimer
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      {absences.length > 5 && (
        <button onClick={() => setExpanded(!expanded)}>
          {expanded ? "Réduire" : "Voir plus"}
        </button>
      )}
    </div>
  );
};

const StatistiqueCard = ({ label, value }) => (
  <div className="statistique-card">
    <div className="statistique-label">{label}</div>
    <div className="statistique-value">{value}</div>
  </div>
);

export default function App() {
  // Tableau des absences en attente
  const [absencesEnAttente, setAbsencesEnAttente] = useState([
    { id: 1, date: '2023-07-10', heure: '09:00', cours: 'Mathématiques' },
    { id: 2, date: '2023-07-11', heure: '10:30', cours: 'Français' },
    // ...
  ]);

  // Tableau des absences justifiées
  const [absencesJustifiees, setAbsencesJustifiees] = useState([
    { id: 1, date: '2023-07-10', heure: '14:00', cours: 'Histoire' },
    { id: 2, date: '2023-07-11', heure: '15:30', cours: 'Anglais' },
    // ...
  ]);

  // Tableau des absences non-justifiées
  const [absencesNonJustifiees, setAbsencesNonJustifiees] = useState([
    { id: 1, date: '2023-07-10', heure: '11:30', cours: 'Physique' },
    { id: 2, date: '2023-07-11', heure: '13:00', cours: 'Chimie' },
    // ...
  ]);

  const tableWidth = 600; // Largeur du tableau en pixels

  const handleDelete = (id) => {
    // Supprimer l'absence avec l'id donné de la table correspondante
    setAbsencesEnAttente((prevAbsences) =>
      prevAbsences.filter((absence) => absence.id !== id)
    );

    setAbsencesJustifiees((prevAbsences) =>
      prevAbsences.filter((absence) => absence.id !== id)
    );

    setAbsencesNonJustifiees((prevAbsences) =>
      prevAbsences.filter((absence) => absence.id !== id)
    );
  };

  const totalAbsences = absencesEnAttente.length + absencesJustifiees.length + absencesNonJustifiees.length;
  const tauxPresence = totalAbsences > 0 ? ((totalAbsences - absencesNonJustifiees.length) / totalAbsences) * 100 : 100;
  const totalAbsencesNonJustifiees = absencesNonJustifiees.length;

  return (
    <div className="App">
    <div className="colum">
      <div className="table-container">
        <AbsenceTable
          absences={absencesEnAttente}
          title="Absences en attente"
          onDelete={handleDelete}
          tableWidth={tableWidth}
        />
      </div>
      <div className="table-container">
        <AbsenceTable
          absences={absencesJustifiees}
          title="Absences justifiées"
          onDelete={handleDelete}
          tableWidth={tableWidth}
        />
      </div>
      <div className="table-container">
        <AbsenceTable
          absences={absencesNonJustifiees}
          title="Absences non-justifiées"
          onDelete={handleDelete}
          tableWidth={tableWidth}
        />
      </div>
      </div>
      <div className="statistique-container">
        <StatistiqueCard label="Nombre d'absences" value={totalAbsences} />
        <StatistiqueCard label="Taux de présence" value={`${tauxPresence}%`} />
        <StatistiqueCard label="Absences non-justifiées" value={totalAbsencesNonJustifiees} />
      </div>
    </div>
  );
}

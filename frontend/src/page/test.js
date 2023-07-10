import '../css/App.css';
import React, { useEffect, useState } from 'react';

const StudentList = () => {
  const [students, setStudents] = useState([]);

  useEffect(() => {
    fetch('http://10.1.1.11:3001/etudiant/')
      .then(response => response.json())
      .then(data => setStudents(data))
      .catch(error => console.log(error));
  }, []);

  return (
    <div>
      <h1>Liste des étudiants</h1>
      <ul>
        {students.map(student => (
          <li key={student.prenom}>{student.prenom}</li>
        ))}
      </ul>
    </div>
  );
};

export default StudentList;

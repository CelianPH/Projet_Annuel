import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className='App'>
      <h1>Liste des étudiants</h1>
      <ul>
        {students.map((etudiant, index) => (
          <li key={index}>{etudiant.nom}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;

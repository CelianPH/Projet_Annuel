import React, { useEffect, useState } from 'react';

const UserComponent = () => {
  const [user, setUser] = useState(null);

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const response = await fetch('/user/11'); // Remplacez 11 par l'ID de l'utilisateur souhaité
        const data = await response.json();
        setUser(data);
      } catch (error) {
        console.error(error);
      }
    };

    fetchUser();
  }, []);

  return (
    <div>
      {user ? (
        <div>
          <h2>Informations de l'utilisateur :</h2>
          <p>Code utilisateur : {user.code_utilisateur}</p>
          <p>Nom : {user.nom}</p>
          <p>Prénom : {user.prenom}</p>
          <p>Mail : {user.mail}</p>
        </div>
      ) : (
        <p>Chargement des informations de l'utilisateur...</p>
      )}
    </div>
  );
};

export default UserComponent;
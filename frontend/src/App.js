import React, { Component } from "react";
import "./styles.css";

class App extends Component {
  state = {
    post: {}
  };

  useEffect() {
    fetch("http://10.1.1.11:3001/etudiant/1")
      .then((response) => {
        return response.json();
      })
      .then((result) => {
        setTimeout(() => {
          this.setState({ post: result });
        });
      });
  }

  render() {
    return (
      <div className="App">
        <h1>Liste d'étudiants :</h1>
        {this.state.post.prenom ? this.state.post.prenom : <p>Chargement...</p>}
      </div>
    );
  }
}

export default App;

import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./css/App.css";
import Sidenav from "./composant/navbar";
import Planning from "./page/Planning";
import Home from "./page/Home";
import Justificatifs from "./page/Justificatifs";
import Statistics from "./page/Statistics";
import Login from "./page/login";

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <Sidenav />
        <main>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/planning" element={<Planning />} />
            <Route path="/statistics" element={<Statistics />} />
            <Route path="/Justificatifs" element={<Justificatifs />} />
            <Route path="/login" element={<Login />} />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;

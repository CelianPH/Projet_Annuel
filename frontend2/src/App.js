import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import Login from "./page/login.js";
import Test from "./page/test.js";


function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/test" element={<Test />} />

        {/* /**<Route path="*" element={< />} /> */}
      </Routes>
    </BrowserRouter>
  );
}

export default App;
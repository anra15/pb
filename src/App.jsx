//import './css/App.css';
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './css/App.css';
import Home from './pages/Home';
import FindAProject from './pages/FindAProject';
import ProjectDetails from "./pages/ProjectDetails";
import Projects from './pages/Projects';
import GlobalGoals from './pages/GlobalGoals';
import Navbar from './components/Navbar';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/findaproject" element={<FindAProject />} />
        <Route path="/projectdetails/:id" element={<ProjectDetails />} />
        <Route path="/projects" element={<Projects />} />
        <Route path="/global-goals" element={<GlobalGoals />} />
      </Routes>
    </Router>
  );
}

export default App;

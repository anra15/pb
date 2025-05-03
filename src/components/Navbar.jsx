import React from 'react';
import { Link } from 'react-router-dom';
import '../css/Navbar.css';

function Navbar() {
  return (
    <nav className="navbar">
      <ul className="navbar-list">
        <li className="navbar-item">
          <Link to="/" className="navbar-link">Home</Link>
        </li>
        <li className="navbar-item">
          <Link to="findaproject" className="navbar-link">Find Project</Link>
        </li>
        <li className="navbar-item">
          <Link to="/projects" className="navbar-link">Projects</Link>
        </li>
        <li className="navbar-item">
          <Link to="/global-goals" className="navbar-link">Global Goals</Link>
        </li>
      </ul>
    </nav>
  );
}

export default Navbar;

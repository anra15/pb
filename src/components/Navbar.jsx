import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import '../css/Navbar.css';

function Navbar() {

  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  const toggleMobileMenu = () => {
    setIsMobileMenuOpen(prev => !prev);
  };

  const closeMobileMenu = () => {
    setIsMobileMenuOpen(false);
  };

  return (
    <nav className="navbar">
      <div className="navbar-container">
        <button
            className={`hamburger ${isMobileMenuOpen ? 'open' : ''}`}
            onClick={toggleMobileMenu}
            aria-label="Toggle menu"
          >
            <span className="bar"></span>
            <span className="bar"></span>
            <span className="bar"></span>
        </button>

        <ul className={`navbar-list ${isMobileMenuOpen ? 'open' : ''}`}>
          <li className="navbar-item" onClick={closeMobileMenu}>
            <Link to="/" className="navbar-link">Home</Link>
          </li>
          <li className="navbar-item" onClick={closeMobileMenu}>
            <Link to="/findaproject" className="navbar-link">Find Project</Link>
          </li>
          <li className="navbar-item" onClick={closeMobileMenu}>
            <Link to="/projects" className="navbar-link">Projects</Link>
          </li>
          <li className="navbar-item" onClick={closeMobileMenu}>
            <Link to="/global-goals" className="navbar-link">Global Goals</Link>
          </li>
        </ul>
      </div>
    </nav>
  );
}

export default Navbar;

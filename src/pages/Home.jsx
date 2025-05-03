import React from 'react';
import { Link } from 'react-router-dom';
import '../css/Home.css'; 

function Home() {
  return (
    <div className="home-container">
      <div className="image-container">
        <img 
            src="/welcome-image.jpg" 
            alt="Welcome" 
            className="welcome-image"
          />
      </div>
      <div className="text-container">
          <p className="explanation-text">
            Welcome to Project Buddy! 
          </p>
          <p className="explanation-text">Here, you'll find guidance to find the project that better fits to your needs and the world's.</p>
        </div>
        <div className="button-container">
          <button><Link to="findaproject">Find your project!</Link></button>
        </div>
      </div>
  );
}

export default Home;

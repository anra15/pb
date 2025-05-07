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
        <h2 className="sub-style">
          Welcome to Project Buddy!
        </h2>
        <p className="explanation-text">Here, you'll find guidance to find the project that better fits to your needs and the world's.</p>
      </div>
      <div className="button-container">
        <button className="button-style"><Link to="findaproject">Find your project!</Link></button>
      </div>
      <div className="sta-container">
        <h1 className="sta-title">Here you'll find previous users more famous <br/>answers:</h1>
      
      </div>

    </div>

  );
}

export default Home;

import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import '../css/Home.css';

function Home() {
  const API_URL = import.meta.env.VITE_API_URL;
  const [popularAnswers, setPopularAnswers] = useState(null);

  useEffect(() => {
    fetch(`${API_URL}/popular_answers`)
      .then(res => res.json())
      .then(data => setPopularAnswers(data))
      .catch(err => console.error("Error fetching popular answers:", err));
  }, []);

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
        <p className="explanation-text">Our platform aims to make it easier to find the project that best suits your knowledge and needs, while also raising awareness of the Global Goals and doing our part.</p>
        <p></p>
        <p className="explanation-text">Here, you'll find guidance to find the project that better fits to your needs and the world's.</p>
      </div>
      <div className="button-container">
        <button className="button-style"><Link to="findaproject">Find your project!</Link></button>
      </div>
      <div className="sta-container"  style={{ color: 'black' }}>
        <h1 className="sta-title">
          Here you'll find previous users most famous <br />answers:
        </h1>
        {popularAnswers ? (
          <div className="popular-answers">
            {Object.entries(popularAnswers).map(([category, items]) => (
              <div key={category}>
                <h3>{category}</h3>
                <ul>
                  {items.map(([item, count]) => (
                    <li key={item}>{item} ({count} votes)</li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
        ) : (
          <p>Loading popular answers...</p>
        )}
      </div>
      <div className="more-home-container">
        <h1>Hey!</h1>
        <h2>If you're interested of knowing more about Global Goals, clic the button
          down below to visit the official web page and learn about more actions to help our World!</h2>
        <div className="button-center-wrapper">
          <button className="button-gg-page-home" onClick={() => window.open("https://www.globalgoals.org", "_blank")}>Let's Go!</button>
        </div>
      </div>

    </div>

  );
}

export default Home;

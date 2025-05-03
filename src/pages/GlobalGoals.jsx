import React from 'react';
import '../css/GlobalGoals.css'; 

import { Link } from 'react-router-dom';

function GlobalGoals() {
  return (
    <div className="globalgoals-container">
      <div className="globalgoals-catalog"> 
      <h1 className="title-text">Global Goals</h1>
        <div className="goals-catalog">
            <div className="goal-card">
              <img
                src="../images/gg1.jpg"
                className="goal-image"
              />
              <h3 className="goal-title">No Poverty</h3>
              <p className="goal-description">End poverty in all its<br/>forms everywhere.</p>
            </div> 
            <div className="goal-card">
              <img
                src="../images/gg2.jpg"
                className="goal-image"
              />
              <h3 className="goal-title">Zero Hunger</h3>
              <p className="goal-description">End hunger, achieve food <br/>security and improved nutrition<br/>and promote sustainable<br/>agriculture.</p>
            </div>
            <div className="goal-card">
              <img
                src="../images/gg3.jpg"
                className="goal-image"
              />
              <h3 className="goal-title">Good Health and <br/>Well-Being</h3>
              <p className="goal-description">Ensure healthy lives<br/>and promote well-being for<br/>all at all ages.</p>
            </div>
            <div className="goal-card">
              <img
                src="../images/gg4.jpg"
                className="goal-image"
              />
              <h3 className="goal-title">Quiallity Education</h3>
              <p className="goal-description">Ensure inclusive and<br/>equitable quality education<br/>and promote lifelong<br/>learning opportunities<br/>for all.</p>
            </div>
            <div className="goal-card">
              <img
                src="../images/gg4.jpg"
                className="goal-image"
              />
              <h3 className="goal-title">Quiallity Education</h3>
              <p className="goal-description">Ensure inclusive and<br/>equitable quality education<br/>and promote lifelong<br/>learning opportunities<br/>for all.</p>
            </div>
        </div>
      </div>
    </div>
  );
}

export default GlobalGoals;

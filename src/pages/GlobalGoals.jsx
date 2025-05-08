import React from 'react';
import '../css/GlobalGoals.css';

import { Link } from 'react-router-dom';

function GlobalGoals() {
  return (
    <div className="globalgoals-container">
      <h1 className="title-text">Global Goals</h1>
      <div className="globalgoals-catalog">
        <div className="goal-card">
          <img
            src="../gg1.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">No Poverty</h3>
          <p className="goal-description">End poverty in all its<br />forms everywhere.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg2.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Zero Hunger</h3>
          <p className="goal-description">End hunger, achieve food <br />security and improved nutrition<br />and promote sustainable<br />agriculture.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg3.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Good Health and <br />Well-Being</h3>
          <p className="goal-description">Ensure healthy lives<br />and promote well-being for<br />all at all ages.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg4.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Quiallity Education</h3>
          <p className="goal-description">Ensure inclusive and<br />equitable quality education<br />and promote lifelong<br />learning opportunities<br />for all.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg5.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Gender Equality</h3>
          <p className="goal-description">Achieve gender equality and<br />empower all women and girls.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg6.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Clean Water and <br />Sanitation</h3>
          <p className="goal-description">Ensure availability and <br />sustainable management of<br />water and sanitation for all.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg7.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Affordable and Clean <br />Energy</h3>
          <p className="goal-description">Ensure access to affordable,<br />reliable, sustainable and<br />modern energy for all.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg8.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Decent Work and <br />Economic Growth</h3>
          <p className="goal-description">Promote sustained, inclusive and <br />sustainable economic growth,<br />full and productive employment <br />and decent work for all.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg9.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Industry, Innovation <br />and Infrastructure</h3>
          <p className="goal-description">Build resilient infrastructure,<br />promote inclusive and <br />sustainable industrialization <br />and foster innovation.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg10.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Reduced Inequalities</h3>
          <p className="goal-description">Reduce inequality within <br />and among countries.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg11.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Sustainable Cities <br />and Communities</h3>
          <p className="goal-description">Make cities and human<br />settlements inclusive, safe,<br />resilient and sustainable.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg12.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Responsible<br />Consumption<br />and Production</h3>
          <p className="goal-description">Ensure sustainable consumption<br />and production patterns.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg13.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Climate Action.</h3>
          <p className="goal-description">Take urgent action to<br />combate climate change and<br />its impacts.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg14.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Life Below Water</h3>
          <p className="goal-description">Conserve and sustainably use<br />the oceans, seas and<br />marine resources for sustainable<br />development.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg15.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Life on Land</h3>
          <p className="goal-description">Protect, restore and promote<br />sustainable use of terrestrial<br />ecosystems, sustainably manage forests,<br />combat desertification, and halt<br />and reverse land degradation<br />and halt biodiversity loss.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg16.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Peace, Justice and<br />Strong Institutions</h3>
          <p className="goal-description">Promote peaceful and inclusive<br />societies for sustainable development,<br />provide access to justice<br />for all and build effective,<br />accountable and inclusive<br />institutions at all levels.</p>
        </div>
        <div className="goal-card">
          <img
            src="../images/gg17.jpg"
            className="goal-image"
          />
          <h3 className="goal-title">Partnerships for the Goals</h3>
          <p className="goal-description">Strengthen the means of<br />implementation and revitalize<br />the global partnership<br />for sustainable development.</p>
        </div>
      </div>
      <div className="more-container">
        <h1>Hey!</h1>
        <h2>If you're interested of knowing more about Global Goals, clic the button
          down below to visit the official web page and learn about more actions to help our World!</h2>
        <div className="button-center-wrapper-gg">
          <button className="button-gg-page" onClick={() => window.open("https://www.globalgoals.org", "_blank")}>Let's Go!</button>
        </div>
      </div>
    </div>

  );
}

export default GlobalGoals;
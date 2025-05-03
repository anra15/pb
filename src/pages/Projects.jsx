import React from 'react';
import '../css/Projects.css';
import projectsdata from '../../backend/data/projectsdata.js'; 

import { Link } from 'react-router-dom';

function Projects() {
  return (
    <div className="projects-container">
      <h1 className="title-text">Our Projects</h1>
      <div className="projects-catalog">
        {projectsdata.map((project) => (
            <Link to={`/projectdetails/${project.id}`} key={project.id} className="project-card">
                <img
                src={project.image}
                alt={project.name}
                className="project-image"
                />
                <div className="project-info">
                <h3 className="project-title">{project.name}</h3>
                <h4 className='globalgoal'>{project.globalgoal}</h4>
                <p className="project-description">{project.description}</p>
                </div>
            </Link>
        ))} 
      </div>
    </div>
  );
}

export default Projects;

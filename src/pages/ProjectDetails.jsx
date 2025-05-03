import { useParams } from "react-router-dom";
import "../css/ProjectDetails.css";
import projectsData from '../../backend/data/projectsdata.js';

function ProjectDetails() {
    const { id } = useParams(); 
    const project = projectsData.find(proj => proj.id === parseInt(id));

    if (!project) {
        return <h2>Project not found</h2>;
    }

    return (
        <div className="projects-display">
            <div className="content-container">
                <h1 className="project-title">{project.name}</h1>
                <img src={project.image} alt={project.name} className="project-image"/>
                <p className="globalgoal-title">{project.globalgoal}</p>
                <p className="project-description">{project.description}</p>
                <p className="project-description">Type of project: {project.tags.type}</p>
                <p className="project-description">Frontend sugestions for the project: {project.tags.frontend}</p>
                <p className="project-description">Backend sugestions for the project: {project.tags.backend}</p>
                <p className="project-description">Database sugestions for the project: {project.tags.database}</p>
            </div>
        </div>
    );
}

export default ProjectDetails;

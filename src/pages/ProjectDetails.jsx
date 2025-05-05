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
                <h4 className="project-title">{project.name}</h4>
                <img src={project.image} alt={project.name} className="project-image"/>
                <h1 className="globalgoal-title">{project.globalgoal}</h1>
                <p className="project-description">{project.description}</p>
                <p className="project-description-sub">Type of project:</p><p className="project-description">{project.tags.type}</p>
                <p className="project-description-sub">Frontend sugestions for the project:</p><p className="project-description"> {project.tags.frontend}</p>
                <p className="project-description-sub">Backend sugestions for the project:</p><p className="project-description"> {project.tags.backend}</p>
                <p className="project-description-sub">Database sugestions for the project:</p><p className="project-description"> {project.tags.database}</p>
            </div>
        </div>
    );
}

export default ProjectDetails;

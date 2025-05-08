import { useParams } from "react-router-dom";
import "../css/ProjectDetails.css";
import projectsData from '../../backend/data/projectsdata.js';

function ProjectDetails() {
    const { id } = useParams();
    const project = projectsData.find(proj => proj.id === parseInt(id));

    if (!project) {
        return <h2>Project not found</h2>;
    }

    const handleSaveProject = async () => {
        try {
            const response = await fetch("http://127.0.0.1:5000/save_project", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(project)
            });

            if (!response.ok) {
                const errorText = await response.text();
                throw new Error(`Failed to save project: ${response.status} - ${errorText}`);
            }

            const result = await response.json();
            console.log("Project saved successfully:", result);
            const rating = prompt("¿Qué tan satisfecho estás del 1 al 10?");
            if (rating && !isNaN(rating)) {
                fetch("http://localhost:5000/save_rating", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ rating: parseInt(rating, 10) }),
                })
                    .then((res) => res.json())
                    .then((data) => console.log("Rating guardado:", data))
                    .catch((err) => console.error("Error guardando rating", err));
            }
        } catch (error) {
            console.error("Error saving project:", error);
            alert("Error al guardar el proyecto. Revisa la consola para más detalles.");
        }
    };

    return (
        <div>
            <div className="content-container">
                <h4 className="project-title">{project.name}</h4>
                <img src={project.image} alt={project.name} className="project-image" />
                <h1 className="globalgoal-title">Global Goal: {project.globalgoal}</h1>
                <p className="project-description">{project.description}</p>
                <div>
                    <p className="project-description-sub">Type of project:</p>
                    <p className="project-description">{project.tags.type.join(', ')}</p>

                    <p className="project-description-sub">Frontend suggestions for the project:</p>
                    <p className="project-description">{project.tags.frontend.join(', ')}</p>

                    <p className="project-description-sub">Backend suggestions for the project:</p>
                    <p className="project-description">{project.tags.backend.join(', ')}</p>

                    <p className="project-description-sub">Database suggestions for the project:</p>
                    <p className="project-description">{project.tags.database.join(', ')}</p>
                </div>

                <button onClick={handleSaveProject}>Elegir este proyecto</button>
            </div>
        </div>
    );
}

export default ProjectDetails;

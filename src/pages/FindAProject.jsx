import React, { useState, useEffect } from "react";
import "../css/FindAProject.css";
import { Link } from "react-router-dom";

function FindAProject() {
  const API_URL = import.meta.env.VITE_API_URL;
  const [recommendedProject, setRecommendedProject] = useState(null);
  const [recommendationId, setRecommendationId] = useState(null);
  const [loading, setLoading] = useState(false);
  const [step, setStep] = useState(0);
  const [answers, setAnswers] = useState({
    globalgoal: [],
    type_proj: [],
    frontend: [],
    backend: [],
    database: [],
  });

  const questions = [
      {
      id: "globalgoal", text: "What Global Goal are you interested in? (You can pick more than one)",
      options: [
        "1. No Poverty", "2. Zero Hunger", "3. Good Health and Well-Being", "4. Quality Education",
        "5. Gender Equality", "6. Clean Water and Sanitation", "7. Affordable and Clean Energy",
        "8. Decent Work and Economic Growth", "9. Industry, Innovation and Infrastructure",
        "10. Reduced Inequalities", "11. Sustainable Cities and Communities",
        "12. Responsible Consumption and Production", "13. Climate Action", "14. Life Below Water",
        "15. Life on Land", "16. Peace, Justice and Strong Institutions", "17. Partnerships for the Goals"
      ]
    },
    {
      id: "type_proj", text: "What kind of project would you like to create?",
      options: ["Mobile-Web App", "Web App", "Mobile App", "Chatbot"]
    },
    {
      id: "frontend", text: "With what would you like to develop the FrontEnd of the project?",
      options: ["React", "Vue.js", "Angular", "Next.js", "WebXr", "React Native", "Flutter"],
      skippable: true
    },
    {
      id: "backend", text: "With what would you like to develop the BackEnd of the project?",
      options: ["Django", "Node.js", "Spring Boot", "Flask", "FastAPI"],
      skippable: true
    },
    {
      id: "database", text: "With what would you like to develop the Database of the project?",
      options: ["PostgreSQL", "MySQL", "Firebase", "MongoDB", "SQLite", "IPFS", "InfluxDB"],
      skippable: true
    },
  ];

  const handleAnswer = (option) => {
    const currentQuestion = questions[step];

    setAnswers((prevAnswers) => {
      const updatedAnswers = prevAnswers[currentQuestion.id].includes(option)
        ? prevAnswers[currentQuestion.id].filter((item) => item !== option)
        : [...prevAnswers[currentQuestion.id], option];

      return { ...prevAnswers, [currentQuestion.id]: updatedAnswers };
    });
  };

  const nextStep = async () => {
    if (step < questions.length - 1) {
      setStep(step + 1);
    } else {
      console.log("Final User Answers Before Sending:", answers);
      try {
        const response = await fetch(`${API_URL}/save_answers`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(answers)
        });

        if (!response.ok) {
          const errorText = await response.text();
          throw new Error(`Failed to save answers: ${response.status} - ${errorText}`);
        }

        console.log("Answers saved successfully");
      } catch (error) {
        console.error("Error saving answers:", error);
      }

      setStep(questions.length);
    }
  };

  const skipQuestion = () => {
    nextStep();
  };

  const handleFinish = async () => {
    setLoading(true);
    console.log("Sending request with:", JSON.stringify(answers));

    try {
      const response = await fetch(`${API_URL}/find_project`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(answers),
      });

      console.log("Response status:", response.status);

      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`HTTP error! Status: ${response.status}, Message: ${errorText}`);
      }

      const bestProject = await response.json();
      console.log("Received project:", bestProject);
      setRecommendedProject(bestProject);

      const saveResponse = await fetch(`${API_URL}/save_recommendations`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ projects: bestProject })
      });

      if (!saveResponse.ok) {
        const errorText = await saveResponse.text();
        throw new Error(`Failed to save answers: ${saveResponse.status} - ${errorText}`);
      }

      const saveResult = await saveResponse.json();
      setRecommendationId(saveResult.id);
    } catch (error) {
      console.error("Error fetching project:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (step === questions.length) {
      handleFinish();
    }
  }, [step]);

  return (
    <div className="find-project-container">
      <div><h1 className="find-text">Find the Perfect Project for You</h1></div>

      <div className="content-container-fp">

        {step < questions.length ? (
          <div className="question-container">
            <h2 className="txtColor">{questions[step].text}</h2>
            <div className="options-container">
              {questions[step].options.map((option) => (
                <button
                  key={option}
                  className={`option-button ${answers[questions[step].id].includes(option) ? "selected" : ""}`}
                  onClick={() => handleAnswer(option)}
                >
                  {option}
                </button>
              ))}
            </div>

            <button className="next-button" onClick={nextStep}>Next</button>

            {questions[step].skippable && (
              <button className="skip-button" onClick={skipQuestion}>Skip</button>
            )}
          </div>
        ) : (
          <div>
          </div>
        )}

        {recommendedProject && recommendedProject.length > 0 && (
          <div className="container">
            <div className="recommended-projects">
              <h1 className="reco-title">Recommended Projects</h1>
              <h2 className="reco-subtext">Please select one project</h2>
              <div className="projects-catalog-fp">
                {recommendedProject.map((project, index) => (
                  <Link to={`/projectdetails/${project.id}`} key={index} className="project-card-fp">
                    <img
                      src={project.image}
                      alt={project.name}
                      className="project-image-fp"
                    />
                    <div className="project-info-fp">
                      <h3 className="project-title-fp">{project.name}</h3>
                      <h4 className='globalgoal-fp'>{project.globalgoal}</h4>
                      <p className="project-description-fp">{project.description}</p>
                    </div>
                  </Link>
                ))}
              </div>
              <>
              </>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default FindAProject;

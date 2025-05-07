from flask import Flask, request, jsonify
from flask_cors import CORS
import json


app = Flask(__name__)
CORS(app)

# Load projects data from a JSON file
with open("projectsdata.json", "r") as file:
    projects = json.load(file)

def find_best_projects(answers, max_results=5):
    """Find the top matching projects based on user answers, prioritizing globalgoal match."""
    matches = []

    for project in projects:
        project_tags = project.get("tags", {})

        # 1. Strict filter: only include projects that match at least one selected global goal
        user_goals = answers.get("globalgoal", [])
        project_goals = project_tags.get("globalgoal", [])

        if not any(goal in project_goals for goal in user_goals):
            continue  # Skip this project if it doesn't match any selected global goal

        # 2. Count total matches across other criteria
        match_count = 0
        for key in answers:
            if key in project_tags and answers[key]:
                for answer in answers[key]:
                    if answer in project_tags[key]:
                        match_count += 1

        matches.append((project, match_count))

    # Sort projects by number of matching tags (descending)
    matches.sort(key=lambda x: x[1], reverse=True)

    # Return top N matches
    best_projects = [match[0] for match in matches[:max_results]]

    return best_projects

@app.route('/find_project', methods=['POST'])
def find_project():
    data = request.get_json()
    print("Received data:", data)  # Debug print
    if not data:
        return jsonify({"error": "No data received"}), 400
    
    best_projects = find_best_projects(data)  # Use updated matching logic

    if best_projects:
        return jsonify(best_projects)  # Return list of up to 3 projects
    else:
        return jsonify([])  # Return empty list if no matches found

if __name__ == '__main__':
    print("Starting Flask server...")  # Debugging message
    app.run(debug=True)

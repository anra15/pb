from flask import Flask, request, jsonify
from flask_cors import CORS
import json


app = Flask(__name__)
CORS(app)

# Load projects data from a JSON file
with open("projectsdata.json", "r") as file:
    projects = json.load(file)

def find_best_projects(answers, max_results=5):
    """Find the top matching projects based on user answers."""
    matches = []

    for project in projects:
        match_count = 0

        # Compare user answers with project tags
        for key in answers:
            if key in project["tags"] and answers[key]:  # Ensure the key exists in the project's tags
                for answer in answers[key]:
                    if answer in project["tags"][key]:
                        match_count += 1

        if match_count > 0:
            matches.append((project, match_count))

    # Sort projects by the number of matches (descending order)
    matches.sort(key=lambda x: x[1], reverse=True)

    # Get top matching projects (max_results)
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

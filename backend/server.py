from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2
import json
import os

app = Flask(__name__)
CORS(app)

def insert_user_answers(answers):
    try:
        conn = psycopg2.connect(
            dbname="projectbuddb",
            user="postgres",
            password="admin",
            host="127.0.0.1",
            port="5432"
        )
        cur = conn.cursor()

        # Extraer directamente sin serializar
        frontend = answers.get("frontend", [])
        backend = answers.get("backend", [])
        type_proj = answers.get("type_proj", [])
        globalgoal = answers.get("globalgoal", [])
        databases = answers.get("database", [])  # No usar .get("databases")

        query = """
            INSERT INTO "Answers" (frontend, backend, type_proj, globalgoal, databases)
            VALUES (%s, %s, %s, %s, %s)
        """
        cur.execute(query, [
            json.dumps(frontend, ensure_ascii=False),
            json.dumps(backend, ensure_ascii=False),
            json.dumps(type_proj, ensure_ascii=False),
            json.dumps(globalgoal, ensure_ascii=False),
            json.dumps(databases, ensure_ascii=False)
        ])
        conn.commit()
        cur.close()
        conn.close()
        print("Respuestas insertadas correctamente.")
    except Exception as e:
        print("Error inserting user answers:", e)
        raise

@app.route('/save_answers', methods=['POST'])
def save_answers():
    data = request.get_json(silent=True)
    if data is None:
        return jsonify({"error": "Invalid JSON received"}), 400
    print("Received answers to save:", data)

    if not data:
        return jsonify({"error": "No data received or JSON is malformed"}), 400

    try:
        print("Parsed JSON data:", data)
        insert_user_answers(data)
        return jsonify({"status": "success"}), 200
    except Exception as e:
        print("Error saving answers:", e)  # Ayuda a depurar en consola
        return jsonify({"error": str(e)}), 500

def insert_recommendations(answers):
    try:
        conn = psycopg2.connect(
            dbname="projectbuddb",
            user="postgres",
            password="admin",
            host="127.0.0.1",
            port="5432"
        )
        cur = conn.cursor()

        projects = answers.get("projects", [])

        query = """
            INSERT INTO "Recommendations" (projects)
            VALUES (%s)
            RETURNING id;
        """
        cur.execute(query, [json.dumps(projects, ensure_ascii=False)])
        inserted_id = cur.fetchone()[0]  # ⬅️ Obtener el ID insertado

        conn.commit()
        cur.close()
        conn.close()
        print("Respuestas insertadas correctamente. ID:", inserted_id)
        return inserted_id  # ⬅️ Devolver el ID

    except Exception as e:
        print("Error inserting user answers:", e)
        raise

@app.route('/save_recommendations', methods=['POST'])
def save_recommendations():
    data = request.get_json(silent=True)
    if data is None:
        return jsonify({"error": "Invalid JSON received"}), 400

    print("Received answers to save:", data)

    if not data:
        return jsonify({"error": "No data received or JSON is malformed"}), 400

    try:
        print("Parsed JSON data:", data)
        inserted_id = insert_recommendations(data)  # ⬅️ Guardar y obtener el ID
        return jsonify({"status": "success", "id": inserted_id}), 200  # ⬅️ Retornar el ID al frontend
    except Exception as e:
        print("Error saving answers:", e)
        return jsonify({"error": str(e)}), 500
    
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
    print("Raw data:", request.data)
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

@app.route('/get_recommendations/<int:rec_id>', methods=['GET'])
def get_recommendations(rec_id):
    try:
        conn = psycopg2.connect(
            dbname="projectbuddb",
            user="postgres",
            password="admin",
            host="127.0.0.1",
            port="5432"
        )
        cur = conn.cursor()
        query = 'SELECT projects FROM "Recommendations" WHERE id = %s'
        cur.execute(query, (rec_id,))
        result = cur.fetchone()
        cur.close()
        conn.close()

        if result:
            projects = result[0]
            return jsonify(projects), 200
        else:
            return jsonify({"error": "Recommendation ID not found"}), 404

    except Exception as e:
        print("Error retrieving recommendations:", e)
        return jsonify({"error": str(e)}), 500

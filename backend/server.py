from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2
import json
import os
from collections import Counter

app = Flask(__name__)
CORS(app)

# Función para conexión a la base de datos
def get_connection():
    return psycopg2.connect(
        dbname="projectbuddb",
        user="postgres",
        password="admin",
        host="127.0.0.1",
        port="5432"
    )

# =====================
# FUNCIONES AUXILIARES
# =====================

def insert_user_answers(answers):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                query = """
                    INSERT INTO "Answers" (frontend, backend, type_proj, globalgoal, databases)
                    VALUES (%s, %s, %s, %s, %s)
                """
                cur.execute(query, [
                    json.dumps(answers.get("frontend", []), ensure_ascii=False),
                    json.dumps(answers.get("backend", []), ensure_ascii=False),
                    json.dumps(answers.get("type_proj", []), ensure_ascii=False),
                    json.dumps(answers.get("globalgoal", []), ensure_ascii=False),
                    json.dumps(answers.get("database", []), ensure_ascii=False)
                ])
        print("Respuestas insertadas correctamente.")
    except Exception as e:
        print("Error inserting user answers:", e)
        raise

def insert_recommendations(answers):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                query = """
                    INSERT INTO "Recommendations" (projects)
                    VALUES (%s)
                    RETURNING id;
                """
                cur.execute(query, [json.dumps(answers.get("projects", []), ensure_ascii=False)])
                inserted_id = cur.fetchone()[0]
        print("Recomendaciones insertadas correctamente. ID:", inserted_id)
        return inserted_id
    except Exception as e:
        print("Error inserting recommendations:", e)
        raise

def insert_user_projects(project):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                query = """
                    INSERT INTO "Project_selection" (project)
                    VALUES (%s)
                """
                cur.execute(query, [json.dumps(project, ensure_ascii=False)])
        print("Proyecto insertado correctamente.")
    except Exception as e:
        print("Error al insertar el proyecto:", e)
        raise

@app.route('/save_rating', methods=['POST'])
def save_rating():
    data = request.get_json()
    rating = data.get('rating')
    if not rating or not isinstance(rating, int):
        return jsonify({"error": "Invalid rating"}), 400

    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute('INSERT INTO "Questionnaire" (satisfaction) VALUES (%s)', (rating,))
        return jsonify({"status": "success"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route('/popular_answers', methods=['GET'])
def get_popular_answers():
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute('SELECT frontend, backend, type_proj, globalgoal, databases FROM "Answers"')
                rows = cur.fetchall()

        categories = ['frontend', 'backend', 'type_proj', 'globalgoal', 'databases']
        counters = {cat: Counter() for cat in categories}

        for row in rows:
            for i, value in enumerate(row):
                try:
                    items = value
                    if isinstance(items, list):
                        counters[categories[i]].update(items)
                except Exception as e:
                    print(f"Error decoding JSON in {categories[i]}: {e}")

        # Return top 3 of each category
        result = {
            category: counters[category].most_common(3)
            for category in categories
        }

        return jsonify(result), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500
# =====================
# CARGA DE PROYECTOS
# =====================
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

# =====================
# RUTAS FLASK
# =====================

@app.route('/save_answers', methods=['POST'])
def save_answers():
    data = request.get_json(silent=True)
    if not data:
        return jsonify({"error": "Invalid or no JSON received"}), 400
    try:
        insert_user_answers(data)
        return jsonify({"status": "success"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/save_recommendations', methods=['POST'])
def save_recommendations():
    data = request.get_json(silent=True)
    if not data:
        return jsonify({"error": "Invalid or no JSON received"}), 400
    try:
        inserted_id = insert_recommendations(data)
        return jsonify({"status": "success", "id": inserted_id}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/save_project', methods=['POST'])
def save_project():
    data = request.get_json(silent=True)
    if not data:
        return jsonify({"error": "Invalid or no JSON received"}), 400
    try:
        insert_user_projects(data)
        return jsonify({"status": "success"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

    # Return top N matches
    best_projects = [match[0] for match in matches[:max_results]]

    return best_projects

@app.route('/find_project', methods=['POST'])
def find_project():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No data received"}), 400
    best_projects = find_best_projects(data)
    return jsonify(best_projects), 200

@app.route('/get_recommendations/<int:rec_id>', methods=['GET'])
def get_recommendations(rec_id):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                query = 'SELECT projects FROM "Recommendations" WHERE id = %s'
                cur.execute(query, (rec_id,))
                result = cur.fetchone()
        if result:
            return jsonify(result[0]), 200
        return jsonify({"error": "Recommendation ID not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# =====================
# INICIO DEL SERVIDOR
# =====================
if __name__ == '__main__':
    print("Starting Flask server...")
    app.run(debug=True)

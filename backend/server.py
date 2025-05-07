from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2
import json
import os

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

# =====================
# CARGA DE PROYECTOS
# =====================
with open("projectsdata.json", "r") as file:
    projects = json.load(file)

def find_best_projects(answers, max_results=5):
    matches = []

    for project in projects:
        match_count = 0
        for key in answers:
            if key in project.get("tags", {}) and answers[key]:
                match_count += sum(1 for answer in answers[key] if answer in project["tags"][key])
        if match_count > 0:
            matches.append((project, match_count))

    matches.sort(key=lambda x: x[1], reverse=True)
    return [match[0] for match in matches[:max_results]]

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

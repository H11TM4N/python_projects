"""Todo CRUD Api"""

from app.routes.todo_routes import todo_bp
from app.config.config import app

# register blueprints
app.register_blueprint(todo_bp)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)

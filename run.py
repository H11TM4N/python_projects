"""Todo CRUD Api"""

from app.routes import todo_routes, auth_routes
from app.config.config import app

# register blueprints
app.register_blueprint(auth_routes.auth_bp)
app.register_blueprint(todo_routes.todo_bp)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)

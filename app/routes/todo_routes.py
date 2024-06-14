"""Todo routes"""

from flask import request, jsonify, Blueprint
from bson import ObjectId
from app.models.todo_model import Todo
from app.utils.exceptions import handle_exceptions
from app.config.config import db

todo_bp = Blueprint('todo_bp', __name__)

@todo_bp.route('/')
def test():
    """Test route

    Returns:
        str: A simple message indicating that the route is working.
    """
    return 'Hey there!'


@todo_bp.route('/get_todos', methods=['GET'])
@handle_exceptions
def get_todos():
    """get todos function

    Returns:
        json: list of todos
    """
    todos = []
    for todo in db.todo_flask.find().sort('date_created', -1):
        todo['_id'] = str(todo['_id'])
        todos.append(todo)
    return jsonify(todos)


@todo_bp.route('/add_todo', methods=['POST'])
@handle_exceptions
def add_todo():
    """Function to add todo

    Returns:
        _type_: _description_
    """
    todo_req = Todo(request.json.get('name'),
                    request.json.get('description'),
                    request.json.get('completed'),
                    request.json.get('date_created'),
                    )

    if db.todo_flask.find_one({'todo_name': todo_req.todo_name}):
        return jsonify({'success': False, 'message': 'Todo already exists'}), 409

    db.todo_flask.insert_one(todo_req.to_dict())
    return jsonify({'success': True, 'message': 'Todo added successfully'})


@todo_bp.route('/update_todo/<uid>', methods=['POST'])
def update_todo(uid):
    """Update todo function

    Args:
        uid (str): todo unique id

    Returns:
        json: _description_
    """

    todo_req = Todo(request.json.get('name'),
                    request.json.get('description'),
                    request.json.get('completed'),
                    request.json.get('date_created'),
                    )

    db.todo_flask.find_one_and_update(
        {'_id': ObjectId(uid)}, {'$set': todo_req.to_dict()})

    return jsonify({'success': True, 'message': 'Todo updated successfully'})


@todo_bp.route('/delete_todo/<uid>', methods=['DELETE'])
def delete_todo(uid):
    """_summary_

    Args:
        uid (str): todo unique id

    Returns:
        json: _description_
    """

    db.todo_flask.find_one_and_delete({'_id': ObjectId(uid)})
    return jsonify({'success': True, 'message': 'Todo successfully deleted'})

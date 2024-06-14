"""Exceptions module"""

from functools import wraps
from pymongo import errors
from flask import jsonify


def handle_exceptions(f):
    """_summary_

    Args:
        f (_type_): _description_

    Returns:
        _type_: _description_
    """
    @wraps(f)
    def decorated_function(*args, **kwargs):
        try:
            return f(*args, **kwargs)
        except errors.PyMongoError as e:
            return jsonify({'success': False, 'message': 'An unexpected error \
                            occured', 'error': str(e)}), 500

    return decorated_function

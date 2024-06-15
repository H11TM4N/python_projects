"""Todo routes"""

from flask import request, jsonify, Blueprint
from bson import ObjectId
from models import User
from utils import handle_exceptions
from config.config import db

auth_bp = Blueprint('auth_bp', __name__)

@auth_bp.route('/sign_up', methods=['POST'])
def sign_up():
    """Sign up function
    """


@auth_bp.route('/login', methods=['POST'])
def login():
    """Login function
    """

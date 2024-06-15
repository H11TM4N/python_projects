"""Todo class module"""

from datetime import datetime


class Todo:
    """Todo class
    """

    def __init__(self, todo_name, todo_description, completed=False, date_created=None):
        self.todo_name = todo_name
        self.todo_description = todo_description
        self.completed = completed if completed else False
        self.date_created = date_created if date_created else datetime.now()

    def to_dict(self):
        """Converts todo to a dictionary

        Returns:
            dict: todo in dictionary format
        """
        return {
            'todo_name': self.todo_name,
            'todo_description': self.todo_description,
            'completed': self.completed,
            'date_created': self.date_created,
        }

    @staticmethod
    def from_dict(todo_dict):
        """Takes a dictionary and converts it to a Todo object

        Args:
            todo_dict (dict): todo dictionary argument

        Returns:
            Todo: Todo object
        """
        return Todo(
            todo_name=todo_dict['todo_name'],
            todo_description=todo_dict['todo_description'],
            completed=todo_dict.get('completed', False),
            date_created=todo_dict.get('date_created', datetime.now())
        )

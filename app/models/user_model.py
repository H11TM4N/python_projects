"""User model"""


class User:
    """User class
    """

    def __init__(self, uid, username, email) -> None:
        self.uid = uid
        self.username = username
        self.email = email

    def to_dict(self):
        """Converts User model to a dictionary

        Returns:
            dict: user model if dict format
        """
        return {
            'uid': self.uid,
            'username': self.username,
            'email': self.email,
        }

    @staticmethod
    def from_dict(user_dict):
        """Takes a dictionary and converts it to a User object

        Args:
            user_dict (dict): user dictionary argument

        Returns:
            user: USer object
        """
        return User(
            uid=user_dict['uid'],
            username=user_dict['username'],
            email=user_dict['email'],
        )

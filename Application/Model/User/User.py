'''
    User class:
        This class represents a logged on user
        from the database.
'''
class User:

    # CONSTRUCTOR METHOD
    def __init__(self, pId, pUser, pPassword):
        self.id = pId
        self.user = pUser
        self.password = pPassword
        self.isAdmin = False

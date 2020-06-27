import cx_Oracle

'''
    Database class:
        This class is responsible for all connections,
        queries and data manipulation  
'''
class Database():


    # Constructor method
    def __init__(self, pConnection = ''):
        # No user connected
        self.user_id = None
        
        if pConnection:
            self.connection = cx_Oracle.connect(pConnection)
        else:
            self.connection = None
        

    # Connects to the specified database
    def connect(self, pConnection):
        try:
            self.connection = cx_Oracle.connect(pConnection)
        except:
            print('Error occured')


    # Disconnects from the database
    def disconnect(self):
        self.connection.close()


    # Save the id of the user that logs in
    def logUser(self, pUser, pPassword):
        try: 
            cursor = self.connection.cursor()
            data = [pUser, pPassword]
            user_id = cursor.callfunc('LOGINSYSTEM.LOGIN', int, data)
            cursor.close()

            self.user_id = user_id
        except:
            self.user_id = None
            print('NO USER WAS FOUND')


    # Checks whether the logged user is also an administrator
    def isAdmin(self):
        try:
            pass

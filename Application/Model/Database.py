import cx_Oracle

from Application.Model.User import User

'''
    Database class (SINGLETON):
        This class is responsible for all connections,
        queries and data manipulation  
'''
class Database():

    # Constructor method
    def __init__(self, pConnection = ''):
        # No user connected
        self.userConnected = None
        
        # Declaring a connection right away
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
            
            # Calls the function from the SQL PACKAGE
            data = [pUser, pPassword]
            user_id = cursor.callfunc('LOGINSYSTEM.LOGIN', int, data)

            # Sets the connected user with the corresponding information
            self.userConnected = User(user_id, pUser, pPassword)
            self.userConnected.isAdmin = cursor.callfunc('USERDATA.ISADMIN', int, [user_id])

            cursor.close()

        except Exception as err:
            self.userConnected= None
            print(err)


    def signUp(self, pUser, pPassword):
        try:
            cursor = self.connection.cursor()

            data = (pUser, pPassword)

            print(pUser, pPassword)

            cursor.callproc('LOGINSYSTEM.SIGNUP', data)

            cursor.close()

        except Exception as err:
            print('Error inserting user:', err)
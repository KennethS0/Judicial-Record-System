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
        '''
        Creates an instance of Database, if a connection
        is passed as the argument then it will connect
        autimatically.
        '''
        
        # No user connected
        self.userConnected = None
        
        # Declaring a connection right away
        if pConnection:
            self.connection = cx_Oracle.connect(pConnection)
        else:
            self.connection = None
        

    def connect(self, pConnection):
        '''
        Connects to the specified database
        '''
        try:
            self.connection = cx_Oracle.connect(pConnection)
        except:
            print('Error occured')


    def disconnect(self):
        '''
            Closes the database connection.
        '''
        self.connection.close()


    def logUser(self, pUser, pPassword):
        '''
            Logs in a user and sets it to connectedUser
            in the database object.
        '''
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
        '''
        Registers a user into the database.
        '''
        try:
            cursor = self.connection.cursor()
            data = (pUser, pPassword)

            # Inserts the data, calling the procedure
            cursor.callproc('LOGINSYSTEM.SIGNUP', data)

            cursor.close()

        except Exception as err:
            print('Error inserting user:', err)


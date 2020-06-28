import cx_Oracle

from Application.Model.User import User
from Application.Model.DatabaseConnection import Instructions as I

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
            self.userConnected = User.User(user_id, pUser, pPassword)
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


    def adminQuery (self, pType, pPackageInstruction, parameters=[], returnType=None, getRows=False):
        '''
            Returns the result of a specified query
            pType : Type of query (PROCEDURE or FUNCTION)
            pPackageInstruction: Instruction defined in the Database Packages
            parameters: List of parameters that the function or procedure needs
            returnType: Must match the value returned by a function
            getRows: True if it is expected to return rows.
        '''
        if pType == I.PROCEDURE:
            return self.__adminProcedure(pPackageInstruction, parameters, getRows)
        elif pType == I.FUNCTION:
            return self.__adminFunction(pPackageInstruction, parameters, returnType)


    def __adminProcedure(self, pPackageInstruction, pParameters, pGetRows):
        '''
        Returns all the selected rows from the table IF
        the user has permissions to view them.
        '''
        
        # Checks for valid user (has to be an admin)
        if not ( self.userConnected and self.userConnected.isAdmin ):
            return
        
        else:
            return self.__callProcedure(pPackageInstruction, pParameters, pGetRows)


    def __adminFunction(self, pPackageInstruction, pArguments, pReturnType):
        '''
        Returns the value returned by a specific query.
        '''
        if pReturnType == None or not ( self.userConnected and self.userConnected.isAdmin):
            return
        
        else:
            return self.__callFunction(pPackageInstruction, pArguments, pReturnType)


    def userQuery (self, pType, pPackageInstruction, parameters=[], returnType=None, getRows=False):
        '''
            Returns the result of a specified query
            pType : Type of query (PROCEDURE or FUNCTION)
            pPackageInstruction: Instruction defined in the Database Packages
            parameters: List of parameters that the function or procedure needs
            returnType: Must match the value returned by a function
            getRows: True if it is expected to return rows.
        '''
        if pType == I.PROCEDURE:
            return self.__userProcedure(pPackageInstruction, parameters, getRows)
        elif pType == I.FUNCTION:
            return self.__userFunction(pPackageInstruction, parameters, returnType)


    def __userProcedure(self, pPackageInstruction, pParameters, pGetRows):
        '''
        Returns all the selected rows from the table IF
        the user has permissions to view them.
        '''
        # Checks for valid user (has to be an admin)
        if not self.userConnected:
            return

        else:
            return self.__callProcedure(pPackageInstruction, pParameters, pGetRows)


    def __userFunction(self, pPackageInstruction, pParameters, pReturnType):
        '''
        Returns the value returned by a specific query.
        '''
        if pReturnType == None or not self.userConnected:
            return
        else:
            return self.__callFunction(pPackageInstruction, pParameters, pReturnType)


    def __callProcedure(self, pPackageInstruction, pParameters, pGetRows):
        try:
            
            cursor = self.connection.cursor()
            # Sets the refCursorVar to get output from the procedure
            
            refCursor = self.connection.cursor()
            if pGetRows:
                pParameters.append(refCursor)
            
            # Calls the procedure
            cursor.callproc(pPackageInstruction, pParameters)
            
            # Gets the value returned by the procedure
            cursor.close()
            return refCursor
        
        except Exception as err:
            print(err)


    def __callFunction(self, pPackageInstruction, pParameters, pReturnType):
        try: 
            cursor = self.connection.cursor()
            
            # Calls the function from the SQL PACKAGE
            value = cursor.callfunc(pPackageInstruction, pReturnType, pParameters)
            cursor.close()
            return value

        except Exception as err:
            print(err)
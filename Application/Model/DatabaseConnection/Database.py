import cx_Oracle
import rsa

from Application.Model.User import User
from Application.Model.DatabaseConnection import Instructions as I

'''
    Database class:
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
        self.connectedUser = None
        
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
        self.connectedUser = None


    def logUser(self, pUser, pPassword):
        '''
            Logs in a user and sets it to connectedUser
            in the database object.
        '''
        try: 
            cursor = self.connection.cursor()

            # Gets the encrypted password
            data = [pUser]
            user_id = cursor.callfunc(I.GET_ID, int, data)

            encryptedPassword = cursor.callfunc(I.GET_PASSWORD, bytes, [user_id])
            decryptedPassword = rsa.decrypt(encryptedPassword, self.__getPrivateKey()).decode('utf-8')
            
            if decryptedPassword == pPassword:
                # Sets the connected user with the corresponding information
                self.connectedUser = User.User(user_id, pUser, pPassword)
                self.connectedUser.isAdmin = cursor.callfunc(I.IS_ADMIN , int, [user_id])

            cursor.close()

        except Exception as err:
            self.connectedUser = None
            print(err)


    def signUp(self, pUser, pPassword):
        '''
        Registers a user into the database.
        '''
        try:
            # Encryption 
            encryptedPassword = rsa.encrypt(pPassword.encode('utf-8'), self.__getPublicKey())

            cursor = self.connection.cursor()
            data = (pUser, encryptedPassword)

            # Inserts the data, calling the procedure
            cursor.callproc(I.SIGN_UP, data)

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
        if not ( self.connectedUser and self.connectedUser.isAdmin ):
            return
        
        else:
            return self.__callProcedure(pPackageInstruction, pParameters, pGetRows)


    def __adminFunction(self, pPackageInstruction, pArguments, pReturnType):
        '''
        Returns the value returned by a specific query.
        '''
        if pReturnType == None or not ( self.connectedUser and self.connectedUser.isAdmin):
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
        if not self.connectedUser:
            return

        else:
            return self.__callProcedure(pPackageInstruction, pParameters, pGetRows)


    def __userFunction(self, pPackageInstruction, pParameters, pReturnType):
        '''
        Returns the value returned by a specific query.
        '''
        if pReturnType == None or not self.connectedUser:
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


    def __getPublicKey(self):
        '''
        Method to get the public key in order to encrypt messages. 
        Method turned private for security.
        '''
        return rsa.PublicKey(7448188390935309559762268346969139335445643747358375780699545774849146587133817358590827902682907530426006839207101084773877149373355688748172562976675587, 65537)
    
    
    def __getPrivateKey(self):
        '''
        Method to get the private key in order to decrypt messages.
        Method turned into private key for security.
        '''
        return rsa.PrivateKey(7448188390935309559762268346969139335445643747358375780699545774849146587133817358590827902682907530426006839207101084773877149373355688748172562976675587, 65537, 58415381127313565065807191820530961417505544747886005634673032459106479444200234828576816576660741873314729542542260093985551896547099833610253148818145, 4770878076950975455204481644330156637049818655614541034913282465696905611356178713, 1561177684862443317707859093150293908187485696864728316834700491281791099)

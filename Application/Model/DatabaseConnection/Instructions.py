# Type of instruction constants
PROCEDURE = 1
FUNCTION = 2

#GETDATA
GET_CIRCUITS = 'GETDATA.GETCIRCUITS'
GET_OFFICE = 'GETDATA.GETOFFICES'
GET_RECORDLESS_LAWSUITS = 'GETDATA.GETRECORDLESSLAWSUITS'


#LOGINSYSTEM
SIGN_UP = 'LOGINSYSTEM.SIGNUP'
CHANGE_PASS_AS_USER = 'LOGINSYSTEM.CHANGEPASSWORDASUSER'
CHANGE_PASS_AS_ADMIN = 'LOGINSYSTEM.CHANGEPASSWORDASADMIN'
VERIFY_USER = 'LOGINSYSTEM.VERIFYUSER'

#USERDATA
GET_PASSWORD = 'USERDATA.GETPASSWORD'
GET_ID = 'USERDATA.GETUSERID'
GET_USERNAME = 'USERDATA.GETUSERNAME'
IS_ADMIN = 'USERDATA.ISADMIN'

#ADMIN QUERIES
GET_MODIFIED_USERS = 'ADMIN_QUERIES.GETMODIFIEDPASSWORDS'
GET_NEW_RECORDS = 'ADMIN_QUERIES.GETNEWRECORDS'
GET_UNMODIFIED_USERS = 'ADMIN_QUERIES.GETUNMODIFIEDPASSWORDS'
GET_UNRESOLVED_RECORDS = 'ADMIN_QUERIES.GETUNRESOLVEDRECORDS'
GET_AVERAGE_RECORDS = 'ADMIN_QUERIES.AVERAGERESOLUTIONTIME'

# USER QUERIES
GET_ALL_USERS = 'USER_QUERIES.GETALLUSERS'
GET_BANNED_USERS = 'USER_QUERIES.GETBANNEDUSERS'
GET_COMMITED_CRIMERS = 'USER_QUERIES.GETCOMMITEDCRIMES'
GET_DANGEROUS_CANTONS = 'USER_QUERIES.GETCDANGEROUSCANTONS'
GET_FILTERED_FILES = 'USER_QUERIES.GETFILTEREDFILES'
GET_LONGEST_SENTENCES = 'USER_QUERIES.GETLONGESTSENTENCES'
GET_SOON_TO_EXPIRE = 'USER_QUERIES.GETSOONTOEXPIRE'
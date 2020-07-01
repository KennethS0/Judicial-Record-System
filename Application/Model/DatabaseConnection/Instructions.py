# Type of instruction constants
PROCEDURE = 1
FUNCTION = 2

# LOGIN SYSTEM
VERIFY_USER = 'LOGINSYSTEM.VERIFYUSER'
CHANGE_PASS_AS_ADMIN = 'LOGINSYSTEM.CHANGEPASSWORDASADMIN'
CHANGE_PASS_AS_USER = 'LOGINSYSTEM.CHANGEPASSWORDASUSER'
SIGN_UP = 'LOGINSYSTEM.SIGNUP'
MAKE_ADMIN = 'LOGINSYSTEM.MAKEADMIN'

# ADMIN QUERIES
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
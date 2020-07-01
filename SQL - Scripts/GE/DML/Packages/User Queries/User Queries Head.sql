CREATE OR REPLACE PACKAGE user_queries AS
    -- GETS LIST OF ALL THE BANNED USERS
    PROCEDURE getBannedUsers (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL THE USERS IN THE DATABASE
    PROCEDURE getAllUsers (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS THE MOST DANGEROUS CANTONS 
    PROCEDURE getDangerousZones (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL THE SENTENCES THAT ARE SOON TO EXPIRE
    PROCEDURE getSoonToExpire (pInitialDate DATE, pFinalDate DATE, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS A RANKING OF THE LONGEST SENTENCES
    PROCEDURE getLongestSentences (pInitialDate DATE, pFinalDate Date, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS FILES THROUGH A NUMBER OF FILTERS
    PROCEDURE getFileteredFiles (pInitialDate DATE, pFinalDate DATE, pRecordType NUMBER, pCantonId NUMBER, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL CRIMES COMMITED BY ONE PERSON
    PROCEDURE getCommitedCrimes (pPersonId NUMBER, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS A RANKING OF THE PEOPLE WITH THE MOST AMOUNT OF CRIMES
    PROCEDURE getMostCrimesCommitted (pInitialDate DATE, pFinalDate DATE, pRecordSet OUT SYS_REFCURSOR);
    
END user_queries;
/
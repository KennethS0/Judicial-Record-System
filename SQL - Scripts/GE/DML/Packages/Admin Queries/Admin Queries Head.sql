CREATE OR REPLACE PACKAGE ADMIN_QUERIES AS
    
    -- SHOWS ALL THE USERS THAT HAVE MODIFIED THEIR PASSWORD IN A RANGE OF
    -- DATES
    PROCEDURE getModifiedPasswords (pInitialDate IN VARCHAR2, pFinalDate IN VARCHAR2, pRecordset OUT SYS_REFCURSOR);
    
    -- SHOWS ALL THE NEW RECORDS IN THE DAY
    PROCEDURE getNewRecords (pRecordSet OUT SYS_REFCURSOR);

    -- SHOWS ALL THE USERS THAT HAVEN'T CHANGED THEIR PASSWORD IN THE LAST 10 DAYS
    PROCEDURE getUnmodifiedPasswords(pRecordSet OUT SYS_REFCURSOR);

    -- SHOWS ALL THE USERS THAT HAVEN'T BEEN RESOLVED
    PROCEDURE getUnresolvedRecords(pRecordSet OUT SYS_REFCURSOR);

    -- RETURNS THE AVERAGE TIME IN DAYS FOR A RESOLUTION TO BE PLACED
    FUNCTION averageResolutionTime RETURN NUMBER;
             
END ADMIN_QUERIES;
/
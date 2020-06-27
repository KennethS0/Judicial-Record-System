CREATE OR REPLACE PACKAGE BODY ADMIN_QUERIES AS


    -- GETS ALL THE USERS THAT HAD THEIR PASSWORDS MODIFIED IN A RANGE OF DATES
    PROCEDURE getModifiedPasswords (pInitialDate IN DATE, pFinalDate IN DATE, pRecordset OUT SYS_REFCURSOR) AS
    BEGIN
     OPEN pRecordset FOR   
        -- Shows all the accounts that have changed their password in a range of dates.
        SELECT UNIQUE(ua.username) FROM passwordhistory ph

        -- Joins with USERACCOUNT (ua) to get the id inside of PASSWORDHISTORY
        INNER JOIN useraccount ua
        ON ua.id = ph.user_id

        -- Condition to show in a range of two dates.
        WHERE ph.creation_date BETWEEN pInitialDate AND pFinalDate + 1; 
    END;
        
            
    -- SHOWS ALL THE NEW RECORDS IN THE DAY
    PROCEDURE getNewRecords (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            -- Shows the number of new records in the database.
            -- A record is considered new if it is inserted the same day.1
            SELECT jn.year ||'-'|| jn.consecutive ||'-'|| o.id ||'-'|| o.subject_code as JUDICIAL_NUMBER FROM record r

            -- Joins with JUDICIAL_NUM in order to find the year and consecutive.
            INNER JOIN judicial_num jn 
            ON jn.id = r.number_id
            
            -- Joins with OFFICE in order to find the office id and the subject code.
            INNER JOIN office o 
            ON o.id = jn.office_id
            
            -- Condition to show all the records that were made in the day.
            WHERE r.creation_date >= SYSDATE - 1; 
    END;
    
    
    -- SHOWS ALL THE USERS THAT HAVEN'T CHANGED THEIR PASSWORD IN THE LAST 10 DAYS
    PROCEDURE getUnmodifiedPasswords(pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            -- Shows all the unmodified passwords from the past 10 days.
            SELECT UNIQUE(ua.username) FROM passwordhistory ph
            
            -- Joins with USERACCOUNT(ua) to get the corresponding id's
            INNER JOIN useraccount ua
            ON ua.id = ph.user_id
            
            -- Condition to show only passwords created more than 10 days ago.
            WHERE ph.creation_date <= SYSDATE - 10; 
    END;
    
    
    -- SHOWS ALL THE USERS THAT HAVEN'T BEEN RESOLVED
    PROCEDURE getUnresolvedRecords(pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            -- Selects the records where the resolution id is not present.
            SELECT jn.year ||'-'|| jn.consecutive ||'-'|| o.id ||'-'|| o.subject_code AS JUDICIAL_NUMBER FROM record r
            
            -- Joins with JUDICIAL_NUM in order to find the year and consecutive.
            INNER JOIN judicial_num jn 
            ON jn.id = r.number_id
            
            -- Joins with OFFICE in order to find the office id and the subject code.
            INNER JOIN office o 
            ON o.id = jn.office_id
            
            -- Condition to get only the records without a resolution
            WHERE r.resolution_id IS NULL;
    END;
    
    
    -- RETURNS THE AVERAGE TIME IN DAYS FOR A RESOLUTION TO BE PLACED
    FUNCTION averageResolutionTime 
    RETURN NUMBER
    IS
        average NUMBER(15);
    BEGIN
        -- Shows the average time for a resolution (If a record doesn't have one then it is not counted.)
        SELECT AVG(psp.date_submitted - r.resolution_date) INTO average FROM resolution r
        
        -- Joins with RECORD (re) to get the corresponding resolution
        INNER JOIN record re
        ON re.resolution_id = r.id
        
        -- Joins with PERSON_SUES_PERSON (psp) to get the date_submitted
        INNER JOIN person_sues_person psp
        ON psp.id = re.sue_id
        
        -- Condition to not get NULL data
        WHERE r.resolution_date IS NOT NULL;
        
        return (average);
    END;
    
END Admin_Queries;
/
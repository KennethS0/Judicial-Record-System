CREATE OR REPLACE PACKAGE BODY LogInSystem AS
       
       
    -- CHECKS DATA OF THE USER AND RETURNS ITS ID IF FOUND
    FUNCTION login (pUsername IN VARCHAR2, pPassword IN VARCHAR2)
    RETURN NUMBER 
    IS 
        useraccountId NUMBER;
    BEGIN
        -- SELECTS WITH VERIFICATION
        SELECT id INTO userAccountId FROM USERACCOUNT
        WHERE username = pUsername 
        AND password = pPassword;
        RETURN(userAccountId);
    END;
    
       
    -- INSERTS A USER INTO THE DATABASE
    PROCEDURE signup (pUsername IN VARCHAR2, pPassword IN VARCHAR2) 
    IS
    BEGIN 
        INSERT INTO useraccount(username, password)
        VALUES (pUsername, pPassword);
        COMMIT;
    END;
        
END LogInSystem;
/
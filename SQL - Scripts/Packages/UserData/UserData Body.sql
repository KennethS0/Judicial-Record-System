CREATE OR REPLACE PACKAGE BODY userdata AS
    
    -- GETS THE USERNAME FROM A USER
    FUNCTION getUsername (pId NUMBER) 
    RETURN VARCHAR2
    IS 
    vUsername VARCHAR2(20);
    BEGIN
        SELECT username INTO vUsername FROM useraccount
        WHERE id = pId;
    END;

    -- GETS THE PASSWORD FROM A USER
    FUNCTION getPassword (pId NUMBER)
    RETURN VARCHAR2
    IS 
    vPassword VARCHAR2(64);
    BEGIN
        SELECT password INTO vPassword FROM useraccount
        WHERE id = pId;
    END;
    
    -- CHANGES THE PASSWORD OF A USER, INTENDED TO BE USED BY A USER
    PROCEDURE changePasswordAsUser (pUsername VARCHAR2, pOldPassword VARCHAR2, pNewPassword VARCHAR2) 
    IS
        oldPassword VARCHAR2(64);
    BEGIN
        
        -- QUERY TO SELECT THE PASSWORD OF THE USER
        SELECT password INTO oldPassword FROM useraccount
        WHERE username = pUsername;
    
    
        -- EITHER UPDATES THE PASSWORD OR SHOWS AN ERROR MESSAGE
        IF oldPassword = pOldPassword THEN
            UPDATE useraccount
            SET password = pNewPassword
            WHERE username = pUsername AND password = pOldPassword;
            COMMIT;
        ELSE 
            dbms_output.put_line('INVALID USERNAME OR PASSWORD');
        END IF;
    END;
    
    
    -- CHANGES THE PASSWORD OF A USER, 
    -- INTENDED TO BE USED BY AN ADMINISTRATOR
    -- TO CHANGE ANY PASSWORD
    PROCEDURE changePasswordAsAdmin (pUsername VARCHAR2, pNewPassword VARCHAR2) 
    IS
    BEGIN
        UPDATE useraccount
        SET password = pNewPassword
        WHERE username = pUsername;
        
        COMMIT;
    END;
    
    
    -- VERIFIES IF THE USER IS ACTUALLY THE ONE USING THE ACCOUNT
    -- INTENDED TO BE USED WHEN MANAGING INFORMATION (PRIVACY)
    FUNCTION verifyUser (pId NUMBER, pPassword VARCHAR2)
    RETURN NUMBER
    IS 
        verified NUMBER(1) := 0;
        passwordCopy VARCHAR2(64);
    BEGIN
        -- RETURNS 1 (TRUE) IF THE PASSWORD MATCHES THE ONE THAT THE USER HAS.
        -- RETURNS 0 (FALSE) IF IT DOESNT
        SELECT password INTO passwordCopy FROM useraccount
        WHERE id = pId;
            
            
        IF passwordCopy = pPassword THEN
            verified := 1;
        END IF;
        
        RETURN (verified);
    END;
    
    
    -- CHECKS IF A USER IS AN ADMIN
    -- pId, refers to its ID in USERACCOUNT
    FUNCTION isAdmin (pId NUMBER)
    RETURN NUMBER
    IS 
        verified NUMBER(1);
    BEGIN
        -- SELECTS THE AMOUNT OF TIMES THAT THE NAME IS REPEATED 
        SELECT COUNT(username) INTO verified FROM administrator
        WHERE user_id = pId;
        
        RETURN(verified);
    END;
    
END userdata;
/
CREATE OR REPLACE PACKAGE BODY LogInSystem AS
       
    -- INSERTS A USER INTO THE DATABASE
    PROCEDURE signup (pUsername IN VARCHAR2, pPassword IN VARCHAR2) 
    IS
    BEGIN 
        INSERT INTO useraccount(username, password)
        VALUES (pUsername, pPassword);
        COMMIT;
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
        passwordCopy VARCHAR2(100);
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
        
        
    -- MAKES A USER AN ADMIN
    PROCEDURE makeAdmin (pUsername VARCHAR2)
    IS
        userCopy VARCHAR2(20);
        passwordCopy VARCHAR2(500);
        userId NUMBER(6);
    BEGIN
        -- GRABS THE DATA
        SELECT username, password, id INTO userCopy, passwordCopy, userId
        FROM useraccount
        WHERE username = pUsername;
                
        -- INSERTS THE DATA
        INSERT INTO administrator (username, password, user_id)
        VALUES (userCopy, passwordCopy, userId);
        
        COMMIT;
    END;
        
        
END LogInSystem;
/
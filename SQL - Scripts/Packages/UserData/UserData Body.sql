CREATE OR REPLACE PACKAGE BODY userdata AS
    
    -- GETS THE USERNAME FROM A USER
    FUNCTION getUsername (pId NUMBER) 
    RETURN VARCHAR2
    IS 
    vUsername VARCHAR2(20);
    BEGIN
        SELECT username INTO vUsername FROM useraccount
        WHERE id = pId;
        
        RETURN (vUsername);
    END;

    -- GETS THE PASSWORD FROM A USER
    FUNCTION getPassword (pId NUMBER)
    RETURN VARCHAR2
    IS 
    vPassword VARCHAR2(500);
    BEGIN
        SELECT password INTO vPassword FROM useraccount
        WHERE id = pId;
        
        RETURN (vPassword);
    END;
    
     -- GETS THE ID OF A SPECIFIC USER
    FUNCTION getUserId (pUsername VARCHAR2)
    RETURN NUMBER
    IS
    vId NUMBER(6);
    BEGIN
        SELECT id INTO vId FROM useraccount
        WHERE username = pUsername;
        
        RETURN (vId);
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
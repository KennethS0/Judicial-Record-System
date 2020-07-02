CREATE OR REPLACE PACKAGE BODY getData AS

     -- GETS ALL JUDICIAL CIRCUITS
    PROCEDURE getCircuits (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT id, description_ FROM judicial_circuit;
    END;
    
    -- GETS ALL THE OFFICES FROM A CIRCUIT
    PROCEDURE getOffices (pCircuitId NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT id, name, subject_code FROM office
            WHERE judicial_circuit_id = pCircuitId;
    END;
    
    
    -- GET LAWSUITS WITHOUT RECORD
    PROCEDURE getRecordlessLawsuits (pUserId NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN 
        OPEN pRecordSet FOR
            SELECT psp.defendant FROM useraccount u
            
            INNER JOIN person p
            ON p.user_id = u.id
            
            INNER JOIN person_sues_person psp
            ON p.citizenship_id = psp.prosecutor
            
            LEFT JOIN record r
            ON psp.id = r.sue_id
    
            WHERE u.id = pUserId AND r.sue_id IS NULL;
    END;
    
    -- GETS THE ID OF THE LAWSUIT
    FUNCTION getLawsuitId (pDefendantId NUMBER, pProsecutorId NUMBER, pReason VARCHAR2)
    RETURN NUMBER
    IS
        vId NUMBER(6);
    BEGIN
        SELECT id INTO vId FROM person_sues_person
        WHERE defendant = pDefendantId AND
        prosecutor = pProsecutorId AND reason = pReason;
        
        RETURN (vId);
    END;
    
END getData;
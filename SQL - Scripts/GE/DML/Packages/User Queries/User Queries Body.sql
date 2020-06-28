CREATE OR REPLACE PACKAGE BODY user_queries AS
    -- GETS LIST OF ALL THE BANNED USERS
    PROCEDURE getBannedUsers (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT useraccount.username, ban.description_
            FROM ban
            
            -- SELECTS THE ROWS SHARED BY BAN AND USERACCOUNT
            INNER JOIN useraccount
            ON ban.user_id = useraccount.ID;
    END;
    
    
    -- GETS LIST OF ALL THE USERS IN THE DATABASE
    PROCEDURE getAllUsers (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT username FROM useraccount;
    END;
    
    -- GETS LIST OF THE MOST DANGEROUS CANTONS
    PROCEDURE getDangerousCantons (pTopN NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT TOP(pTopN) name, count(record.id)
            FROM canton 
            INNER JOIN judicial_circuit 
            ON canton.id = judicial_circuit.canton_id
            INNER JOIN judicial_num
            ON judicial_num.id = judicial_circuit.id
            INNER JOIN record
            ON judicial_num.id = record.number_id
            GROUP BY canton.name, record.id
            ORDER BY count(*) DESC;
    END;
    

    -- GETS ALL THE SENTENCES THAT ARE SOON TO EXPIRE
    PROCEDURE getSoonToExpire (pInitialDate DATE, pFinalDate DATE, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT record.id, person.first_name, person.last_name, person.secondlast_name, sentence.initial_date, sentence.final_date
            FROM person
            INNER JOIN  record
            ON person.id = record.person_id
            INNER JOIN sentence
            ON resolution.id = record._resolution_id
            INNER JOIN resolution
            ON sentence.id = resolution.sencence_id
            Where ((pInitialDate BETWEEN sentence.initial_date AND sentence.final_date) AND (pFinalDate BETWEEN sentence.initial_date AND sentence.final_date)) AND
            (pFinalDate - 1 >= sentence.final_date);
    END;
    
    

    -- GETS A RANKING OF THE LONGEST SENTENCES
    PROCEDURE getLongestSentences (pInitialDate DATE, pFinalDate Date, pTopN NUMBER ,pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
                
           SELECT TOP(pTopN) person.first_name, person.last_name, count(crime.id), sentence.initial_date, sentence.final_date
            FROM person
            INNER JOIN  record
            ON person.id = record.person_id
            INNER JOIN resolution
            ON record.resolution_id = resolution.id
            INNER JOIN sentence
            ON resolution.sentence_id = sentence.id
            INNER JOIN crime
            ON record.id = crime.record_id
            Where (pInitialDate BETWEEN sentence.initial_date AND sentence.final_date) AND (pFinalDate BETWEEN sentence.initial_date AND sentence.final_date)
            GROUP BY person.first_name, person.last_name, record.id
            ORDER BY count(*) ASC;
    END;
    
    -- GETS THE FILES WITH A SERIES OF FILTERS
    PROCEDURE getFileteredFiles (pInitialDate DATE, pFinalDate DATE, pRecordType NUMBER, pCantonId NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR            
            SELECT record.ID, record.user_id, record.description_, record.creation_date
            FROM person
            INNER JOIN  record
            ON person.id = record.person_id
            INNER JOIN sentence
            ON resolution.id = record._resolution_id
            INNER JOIN resolution
            ON sentence.id = resolution.sencence_id
            INNER JOIN type_of_record
            ON record.type_id = type_of_record.id
            INNER JOIN judicial_num
            ON judicial_num.id = record.num_id
            INNER JOIN office
            on judicial_num.office_id = office.id
            INNER JOIN judicial_circuit
            on office.judicial_circuit_id = judicial_circuit.id
            INNER JOIN canton
            on judicial_circuit.canton_id = canton.id
            Where (pInitialDate BETWEEN sentence.initial_date AND sentence.final_date) AND (pFinalDate BETWEEN sentence.initial_date AND sentence.final_date) 
            AND canton.name = NVL(pCantonId, canton.id)
            AND type_of_record.type = NVL(pRecordType, type_of_record.id); 
    END;
            
    -- GETS ALL CRIMES COMMITED BY ONE PERSON
    PROCEDURE getCommitedCrimes (pPersonId NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT record.ID, person.first_name, person.last_name, person.secondlast_name, crime.description_
            FROM person
            INNER JOIN  record
            ON person.citizenship_id = record.person_id
            INNER JOIN crime
            ON crime.record_id = record.id
    END;
        
END user_queries;
/
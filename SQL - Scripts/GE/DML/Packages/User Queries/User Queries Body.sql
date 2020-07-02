CREATE OR REPLACE PACKAGE BODY user_queries AS
    -- GETS LIST OF ALL THE BANNED USERS
    PROCEDURE getBannedUsers (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT useraccount.username, ban.description_, administrator.username
            FROM ban
            
            -- SELECTS THE ROWS SHARED BY BAN AND USERACCOUNT
            INNER JOIN useraccount
            ON ban.user_id = useraccount.ID
            
            -- SELECTS THE ADMINISTRATOR
            INNER JOIN adminbans
            ON adminbans.ban_id = ban.id
            
            INNER JOIN administrator
            ON adminbans.admin_id = administrator.id;
    END;
    
    
    -- GETS LIST OF ALL THE USERS IN THE DATABASE
    PROCEDURE getAllUsers (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT username FROM useraccount;
    END;
    
    
    -- GETS LIST OF THE MOST DANGEROUS CANTONS
    PROCEDURE getDangerousZones (pRecordSet OUT SYS_REFCURSOR) AS
    advalue VARCHAR2(20);
    BEGIN
        -- OBTAINS THE VARIABLE
        SELECT value INTO advalue FROM ad.parameter 
        WHERE name = 'TOP_DANGEROUS_ZONES';
        
        -- QUERY
        OPEN pRecordSet FOR
            SELECT * FROM
                -- SUBQUERY TO GET AMOUNT OF CRIMES PER CANTON: 'ZONE | TOTAL'
                (SELECT DISTINCT(can.name)||', '||prov.name ZONE, COUNT(can.id) TOTAL FROM crime c
                -- JOINS TO GET THE PERSON WHO COMMITED THE CRIME
                INNER JOIN record r
                ON c.record_id = r.id

                INNER JOIN person_sues_person psp
                ON r.sue_id = psp.id

                INNER JOIN person p
                ON psp.defendant = p.citizenship_id

                -- JOINS TO GET THE CANTON WHERE THE PERSON LIVES
                INNER JOIN address a
                ON p.address_id = a.id

                INNER JOIN community com
                ON a.community_id = com.id

                INNER JOIN district d
                ON com.district_id = d.id

                INNER JOIN canton can
                ON d.canton_id = can.id

                INNER JOIN province prov
                ON can.province_id = prov.id

                -- GROUPING AND ORDERING
                GROUP BY can.name, can.id, prov.name, (can.name)||', '||prov.name
                ORDER BY COUNT(can.id) DESC
            )
        WHERE ROWNUM <= CAST(advalue AS NUMBER);
    END;
    
    
    -- GETS ALL THE SENTENCES THAT ARE SOON TO EXPIRE
    PROCEDURE getSoonToExpire (pInitialDate DATE, pFinalDate DATE, pRecordSet OUT SYS_REFCURSOR) AS
    advalue VARCHAR2(20);
    BEGIN
        -- OBTAINS THE VARIABLE
        SELECT value INTO advalue FROM ad.parameter 
        WHERE name = 'TOP_DANGEROUS_ZONES';
        
        -- QUERY
        OPEN pRecordSet FOR
            SELECT jn.year ||'-'|| jn.consecutive ||'-'|| o.id ||'-'|| o.subject_code record_number,   
                   p.first_name ||' '|| p.middle_name ||' '|| p.last_name ||' '|| p.secondlast_name name,
                   top.type sentence,
                   s.final_date
            FROM sentence s
       
            -- GETS THE TYPE OF SENTENCE
            INNER JOIN type_of_sentence top
            ON s.type_of_sentence_id = top.id
       
            -- GETS THE NUMBER OF THE RECORD
            INNER JOIN resolution r
            ON s.id = r.sentence_id
       
            INNER JOIN record re
            ON re.resolution_id = r.id
       
            INNER JOIN judicial_num jn
            ON re.number_id = jn.id
       
            INNER JOIN office o
            ON jn.office_id = o.id
       
            -- GETS THE PERSON
            INNER JOIN person_sues_person psp
            ON re.sue_id = psp.id
       
            INNER JOIN person p
            ON psp.defendant = p.citizenship_id
    
            WHERE (s.final_date BETWEEN pInitialDate AND pFinalDate - CAST(advalue AS NUMBER))
            OR (s.final_date < pInitialDate);
    END;
    
    

    -- GETS A RANKING OF THE LONGEST SENTENCES
    PROCEDURE getLongestSentences (pInitialDate DATE, pFinalDate Date, pRecordSet OUT SYS_REFCURSOR) AS
        advalue VARCHAR2(20);
    BEGIN
        -- OBTAINS THE VARIABLE
        SELECT value INTO advalue FROM ad.parameter 
        WHERE name = 'TOP_LONGEST_SENTENCES';
        
        -- QUERY
        OPEN pRecordSet FOR
            SELECT * FROM 
                (SELECT p.first_name ||' '|| p.middle_name ||' '|| p.last_name ||' '|| p.secondlast_name name,
                toc.name crime,
                s.initial_date,
                s.final_date,
                (s.final_date - s.initial_date) days
                FROM sentence s
            
                -- GETS THE RECORD
                INNER JOIN resolution r
                ON r.sentence_id = s.id
     
                INNER JOIN record re
                ON re.resolution_id = r.id
     
                -- GETS THE CRIME 
                INNER JOIN crime c
                ON c.record_id = re.id
     
                INNER JOIN type_of_crime toc
                ON c.type_id = toc.id
     
                -- GETS THE PERSON RESPONSIBLE
                INNER JOIN person_sues_person psp
                ON re.sue_id = psp.id
     
                INNER JOIN person p
                ON psp.defendant = p.citizenship_id
     
                WHERE (s.final_date BETWEEN pInitialDate AND pFinalDate) OR
                      (s.initial_date BETWEEN pInitialDate AND pFinalDate)
     
                GROUP BY p.first_name, p.middle_name,
                         p.last_name, p.secondlast_name, 
                         s.initial_date, s.final_date,
                         toc.name
                ORDER BY (s.final_date - s.initial_date) DESC)
        WHERE ROWNUM <= CAST(advalue AS NUMBER);
    END;
    
    -- GETS THE FILES WITH A SERIES OF FILTERS
    PROCEDURE getFileteredFiles (pInitialDate DATE, pFinalDate DATE, pRecordType NUMBER, pCantonId NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR            
            SELECT * FROM crime;
    END;
            
    -- GETS ALL CRIMES COMMITED BY ONE PERSON
    PROCEDURE getCommitedCrimes (pPersonId NUMBER, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT jn.year||'-'||jn.consecutive||'-'||o.id||'-'||o.subject_code record_number, 
                   p.first_name||' '|| p.middle_name ||' '|| p.last_name||' '||p.secondlast_name name, 
                   toc.name crime
            FROM person p

            -- SELECTS THE PERSON ACCUSED OF CRIMES
            INNER JOIN person_sues_person psp
            ON p.citizenship_id = psp.defendant

            -- SELECTS THE RECORD WHERE THE PERSON IS
            INNER JOIN record r
            ON psp.id = r.sue_id

            -- SELECTS THE CRIME
            INNER JOIN crime c
            ON c.record_id = r.id

            INNER JOIN type_of_crime toc
            ON toc.id = c.type_id

            -- GETS THE NUMBER OF THE RECORD
            INNER JOIN judicial_num jn
            ON r.number_id = jn.id

            INNER JOIN office o
            ON jn.office_id = o.id
            
            WHERE p.citizenship_id = pPersonId;
    END;
        
    -- GETS A RANKING OF THE PEOPLE WITH THE MOST AMOUNT OF CRIMES
    PROCEDURE getMostCrimesCommitted (pInitialDate DATE, pFinalDate DATE, pRecordSet OUT SYS_REFCURSOR) AS    
        advalue VARCHAR2(20);
    BEGIN
        -- OBTAINS THE VARIABLE
        SELECT value INTO advalue FROM ad.parameter 
        WHERE name = 'TOP_MOST_COMMITTED_CRIMES';
        
        -- QUERY
        OPEN pRecordSet FOR
            SELECT * FROM
            -- SUBQUERY
            (SELECT p.first_name||' '||p.middle_name||' '||p.last_name||' '||p.secondlast_name name,
                    p.citizenship_id,
                    COUNT(c.id) TOTAL_COMMITTED
            FROM record r
    
            -- GETS THE PEOPLE WHO HAVE COMMITED CRIMES
            INNER JOIN crime c
            ON c.record_id = r.id
    
            INNER JOIN person_sues_person psp
            ON psp.id = r.sue_id
    
            INNER JOIN person p
            ON p.citizenship_id = psp.defendant
    
            WHERE c.date_commited BETWEEN pInitialDate AND pFinalDate
    
            GROUP BY p.first_name, p.middle_name,
                     p.last_name, p.secondlast_name,
                     p.citizenship_id
            ORDER BY COUNT(c.id) DESC
            )
        WHERE ROWNUM <= CAST(advalue AS NUMBER);
    END;
END user_queries;
/
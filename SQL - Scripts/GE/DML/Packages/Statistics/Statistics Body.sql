CREATE OR REPLACE PACKAGE BODY statistics AS

-- QUERIES THE PEOPLE WHO HAVE ACCOUNTS IN THE SYSTEM, COUNTS THEM BY GROUPING IN AGE RANGE
    PROCEDURE getAccountRanges (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            -- CREATES AUXILIARY TABLE CONTAINING ALL THE CALCULATED AGES OF PEOPLE WITH ACCOUNTS
            WITH ages AS ( SELECT FLOOR( (SYSDATE - p.birth_date)/ 365) AS age FROM person p
                            INNER JOIN useraccount ua
                            ON ua.id = p.user_id),

            -- AUXILIARY TABLE CREATED THAT GROUPS AGES BY RANGES
            ranges AS (SELECT
                CASE
                    WHEN age BETWEEN 0 AND 18 THEN '[0 - 18]'
                    WHEN age BETWEEN 19 AND 30 THEN '[19 - 30]'
                    WHEN age BETWEEN 31 AND 45 THEN '[31 - 45]'
                    WHEN age BETWEEN 46 AND 55 THEN '[46 - 55]'
                    WHEN age BETWEEN 56 AND 65 THEN '[56 - 65]'
                    WHEN age BETWEEN 66 AND 75 THEN '[66 - 75]'
                    WHEN age BETWEEN 76 AND 85 THEN '[76 - 85]'
                    WHEN age > 85 THEN '[85+]'
                END AS range
                FROM ages)

            -- SELECTSION QUERY
            SELECT range, (COUNT(*) * 100 / (SELECT COUNT(*) FROM ranges)) AS percentage, COUNT(range) AS total FROM ranges
            GROUP BY range
            ORDER BY range ASC;
    END;
    
    
-- GETS ALL EXPIRED SENTENCES IN THE SYSTEM BETWEEN A RANGE OF DATES
    PROCEDURE getExpiredSentences (pInitialDate DATE, pFinalDate DATE, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT COUNT(id) AS expired,
                   ((COUNT(*) * 100) / (SELECT COUNT(*) FROM sentence)) AS percentage,
                   (SELECT COUNT(*) FROM sentence) AS total
            FROM sentence
            WHERE final_date < pInitialDate OR 
            final_date BETWEEN pInitialDate AND pFinalDate
            GROUP BY 1;
    END;
    
    
-- GETS ALL THE FILES FILTERES BY ZONE
    PROCEDURE getFilesByZone (pCountry VARCHAR2,
                              pProvince VARCHAR2, 
                              pCanton VARCHAR2, 
                              pDistrict VARCHAR2, 
                              pCommunity VARCHAR2,
                              pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            SELECT COUNT(*) total, 
                NVL(con.name, '')||', '||NVL(prov.name, '')||', '||NVL(can.name, '')||', '||
                NVL(d.name, '')||', '||NVL(com.name, '') zone
            FROM record r

            INNER JOIN person_sues_person psp
            ON r.sue_id = psp.id

            INNER JOIN person p
            ON p.citizenship_id = psp.defendant

            INNER JOIN address a
            ON p.address_id = a.id

            LEFT JOIN community com
            ON a.community_id = com.id

            LEFT JOIN district d
            ON com.district_id = d.id

            LEFT JOIN canton can
            ON d.canton_id = can.id

            LEFT JOIN province prov
            ON can.province_id = prov.id
            
            LEFT JOIN country con
            ON prov.country_id = con.id

            WHERE con.name = pCountry OR prov.name = pProvince OR can.name = pCanton OR d.name = pDistrict OR 
                  com.name = pCommunity
            GROUP BY NVL(con.name, ''), NVL(prov.name, ''), NVL(can.name, ''), NVL(d.name, ''), NVL(com.name, '')
            ORDER BY total desc;
    END;
    
    
    -- GETS AGE RANGES OF DEFENDANTS
    PROCEDURE getAgesDefendants (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR
            -- CREATES AUXILIARY TABLE CONTAINING ALL THE CALCULATED AGES OF DIFFERENT PEOPLE THAT ARE DEFENDANTS
            WITH ages AS ( SELECT DISTINCT(psp.defendant), FLOOR( (SYSDATE - p.birth_date)/ 365) AS age FROM person_sues_person psp
                            INNER JOIN person p
                            ON p.citizenship_id = psp.defendant),

            -- AUXILIARY TABLE CREATED THAT GROUPS AGES BY RANGES
            ranges AS (SELECT
                        CASE
                            WHEN age BETWEEN 0 AND 18 THEN '[0 - 18]'
                            WHEN age BETWEEN 19 AND 30 THEN '[19 - 30]'
                            WHEN age BETWEEN 31 AND 45 THEN '[31 - 45]'
                            WHEN age BETWEEN 46 AND 55 THEN '[46 - 55]'
                            WHEN age BETWEEN 56 AND 65 THEN '[56 - 65]'
                            WHEN age BETWEEN 66 AND 75 THEN '[66 - 75]'
                            WHEN age BETWEEN 76 AND 85 THEN '[76 - 85]'
                            WHEN age > 85 THEN '[85+]'
                        END AS range
                    FROM ages)

            -- SELECTSION QUERY
            SELECT range, (COUNT(*) * 100 / (SELECT COUNT(*) FROM ranges)) AS percentage, COUNT(range) AS total FROM ranges
            GROUP BY range
            ORDER BY range ASC;
    END;
    
    
-- GETS AGE RANGES OF PROSECUTORS
    PROCEDURE getAgeProsecutors (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordSet FOR

            -- CREATES AUXILIARY TABLE CONTAINING ALL THE CALCULATED AGES OF DIFFERENT PEOPLE THAT ARE PROSECUTORS
            WITH ages AS ( SELECT DISTINCT(psp.prosecutor), FLOOR( (SYSDATE - p.birth_date)/ 365) AS age FROM person_sues_person psp
                            INNER JOIN person p
                            ON p.citizenship_id = psp.prosecutor),

            -- AUXILIARY TABLE CREATED THAT GROUPS AGES BY RANGES
            ranges AS (SELECT
                        CASE
                        WHEN age BETWEEN 0 AND 18 THEN '[0 - 18]'
                        WHEN age BETWEEN 19 AND 30 THEN '[19 - 30]'
                        WHEN age BETWEEN 31 AND 45 THEN '[31 - 45]'
                        WHEN age BETWEEN 46 AND 55 THEN '[46 - 55]'
                        WHEN age BETWEEN 56 AND 65 THEN '[56 - 65]'
                        WHEN age BETWEEN 66 AND 75 THEN '[66 - 75]'
                        WHEN age BETWEEN 76 AND 85 THEN '[76 - 85]'
                        WHEN age > 85 THEN '[85+]'
                    END AS range
                FROM ages)

            -- SELECTSION QUERY
            SELECT range, (COUNT(*) * 100 / (SELECT COUNT(*) FROM ranges)) AS percentage, COUNT(range) AS total FROM ranges
            GROUP BY range
            ORDER BY range ASC;
    END;
    
-- GETS PERCENTAGES AND TOTALS OF RECORDS BY CLASIFICATION
    PROCEDURE getRecordsByClassification (pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordset FOR
            SELECT tor.description,(COUNT(r.type_id) * 100 / (SELECT COUNT(*) FROM record))  AS percentage, COUNT(r.type_id) AS total
            FROM record r
            RIGHT JOIN type_of_record tor
            ON r.type_id = tor.id
            GROUP BY tor.id, r.type_id, tor.description;
    END;
    
  -- GETS AMOUNT OF RECORDS BY TYPE WITH A SPECIFIC SENTENCE
    PROCEDURE getRecordsBySentence (pSentenceType VARCHAR2, pRecordSet OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN pRecordset FOR
            SELECT tor.description, COUNT(res.id) total FROM record re

            -- SHOWS ALL TYPES OF OF RECORDS
            RIGHT JOIN type_of_record tor
            ON tor.id = re.type_id

            -- SHOWS AMOUNT GROUPING CORRECTLY
            INNER JOIN resolution res
            ON res.id = re.resolution_id
            
            INNER JOIN sentence s
            ON res.sentence_id = s.id

            INNER JOIN type_of_sentence tos
            ON s.type_of_sentence_id = tos.id

            WHERE tos.type = pSentenceType

            GROUP BY tor.description
            ORDER BY total DESC;
            
    END;
END;
/
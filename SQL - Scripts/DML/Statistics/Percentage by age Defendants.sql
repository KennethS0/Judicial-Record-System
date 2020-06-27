-- QUERIES THE PEOPLE WHO ARE IN A RECORD, COUNTS THEM BY GROUPING IN AGE RANGE

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
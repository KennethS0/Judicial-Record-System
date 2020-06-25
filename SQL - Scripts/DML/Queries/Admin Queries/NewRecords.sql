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
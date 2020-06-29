-- Selects the records where the resolution id is not present.
SELECT jn.year ||'-'|| jn.consecutive ||'-'|| o.id ||'-'|| o.subject_code AS JUDICIAL_NUMBER FROM record r

-- Joins with JUDICIAL_NUM in order to find the year and consecutive.
INNER JOIN judicial_num jn 
ON jn.id = r.number_id

-- Joins with OFFICE in order to find the office id and the subject code.
INNER JOIN office o 
ON o.id = jn.office_id

-- Condition to get only the records without a resolution
WHERE r.resolution_id IS NULL;
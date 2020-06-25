-- Shows the number of new records in the database.
-- A record is considered new if it is inserted the same day.1
SELECT jn.year ||'-'|| jn.consecutive ||'-'|| o.id ||'-'|| o.subject_code as JUDICIAL_NUMBER FROM record r
INNER JOIN judicial_num jn
ON jn.id = r.number_id
INNER JOIN office o
ON o.id = jn.office_id
INNER JOIN judicial_circuit jc
ON jc.id = o.judicial_circuit_id
WHERE r.creation_date >= SYSDATE - 1;
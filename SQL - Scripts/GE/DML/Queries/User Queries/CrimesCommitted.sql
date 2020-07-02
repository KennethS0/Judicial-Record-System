SELECT record.ID, person.first_name, person.last_name, person.secondlast_name, crime.description_
FROM person
INNER JOIN  record
ON person.citizenship_id = record.person_id
INNER JOIN crime
ON crime.record_id = record.id

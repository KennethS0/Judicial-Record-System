DECLARE @FromDate DATE, @ToDate DATE
DECLARE @ZONE = VARCHAR2
DECLARE @TYPE = VARCHAR2
SELECT @FromDate='2013-01-03', @ToDate='2013-01-09'
SELECT @ZONE = Alajuelita


    
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
Where (@FromDate BETWEEN sentence.initial_date AND sentence.final_date) AND (@ToDate BETWEEN sentence.initial_date AND sentence.final_date) 
AND canton.name = @ZONE
AND type_of_record.type = @TYPE
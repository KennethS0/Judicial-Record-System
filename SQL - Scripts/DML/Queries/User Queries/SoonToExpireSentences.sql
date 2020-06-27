DECLARE @FromDate DATE, @ToDate DATE
SELECT @FromDate='2013-01-03', @ToDate='2013-01-09'

    
SELECT record.ID, person.first_name, person.last_name, person.secondlast_name, sentence.initial_date, sentence.final_date
FROM person
INNER JOIN  record
ON person.id = record.person_id
INNER JOIN sentencel
ON resolution.id = record._resolution_id
INNER JOIN resolution
ON sentence.id = resolution.sencence_id
Where ((@FromDate BETWEEN sentence.initial_date AND sentence.final_date) AND (@ToDate BETWEEN sentence.initial_date AND sentence.final_date)) AND
(@ToDate - 1 YEAR >= sentence.final_date)



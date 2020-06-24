DECLARE @N NUM
SELECT @N = 3
DECLARE @FromDate DATETIME, @ToDate DATETIME
SELECT @FromDate='2013-01-03', @ToDate='2013-01-09'


SELECT TOP(@N) person.first_name, person.last_name, count(record.id), sentence.initial_date, sentence.final_date
FROM person
INNER JOIN  record
ON person.id = record.person_id
INNER JOIN sentence
ON resolution.id = record._resolution_id
INNER JOIN resolution
ON sentence.id = resolution.sencence_id
Where (@FromDate BETWEEN sentence.initial_date AND sentence.final_date) OR (@ToDate BETWEEN sentence.initial_date AND sentence.final_date)
GROUP BY person.first_name, person.last_name, record.id
ORDER BY count(*) DESC;
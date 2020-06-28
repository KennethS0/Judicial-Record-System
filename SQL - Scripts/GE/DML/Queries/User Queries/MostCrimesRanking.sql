DECLARE @N NUM
SELECT @N = 3
DECLARE @FromDate DATETIME, @ToDate DATETIME
SELECT @FromDate='2013-01-03', @ToDate='2013-01-09'


SELECT TOP(@N) person.first_name, person.last_name, count(crime.id), sentence.initial_date, sentence.final_date
FROM person
INNER JOIN  record
ON person.id = record.person_id
INNER JOIN resolution
ON record.resolution_id = resolution.id
INNER JOIN sentence
ON resolution.sentence_id = sentence.id
INNER JOIN crime
ON record.id = crime.record_id
Where (@FromDate BETWEEN sentence.initial_date AND sentence.final_date) AND (@ToDate BETWEEN sentence.initial_date AND sentence.final_date)
GROUP BY person.first_name, person.last_name, record.id
ORDER BY count(*) ASC;


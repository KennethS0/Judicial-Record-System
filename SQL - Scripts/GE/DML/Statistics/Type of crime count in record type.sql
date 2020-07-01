SELECT tor.description, COUNT(res.id) total FROM record re

-- SHOWS ALL TYPES OF OF RECORDS
RIGHT JOIN type_of_record tor
ON tor.id = re.type_id

-- SHOWS AMOUNT GROUPING CORRECTLY
INNER JOIN resolution res
ON res.id = re.resolution_id
INNER JOIN sentence s
ON res.sentence_id = s.id

WHERE s.type_of_sentence_id = 1

GROUP BY tor.description;
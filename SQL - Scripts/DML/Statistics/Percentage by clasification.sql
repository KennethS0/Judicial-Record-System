-- SHOWS THE PERCENTAGE OF RECORD BY CLASIFICATION
SELECT tor.description,(COUNT(r.type_id) * 100 / (SELECT COUNT(*) FROM record))  AS percentage, COUNT(r.type_id) AS total
FROM record r
RIGHT JOIN type_of_record tor
ON r.type_id = tor.id
GROUP BY tor.id, r.type_id, tor.description;

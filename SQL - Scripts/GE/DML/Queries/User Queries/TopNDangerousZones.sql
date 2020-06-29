DECLARE @N INT;
SELECT @N = 3

SELECT TOP(@N) canton.name, count(record.id)
FROM canton
INNER JOIN judicial_circuit 
ON canton.id = judicial_circuit.canton_id
INNER JOIN judicial_num
ON judicial_num.id = judicial_circuit.id
INNER JOIN record
ON judicial_num.id = record.number_id
GROUP BY canton.name, record.id
ORDER BY count(*) DESC;


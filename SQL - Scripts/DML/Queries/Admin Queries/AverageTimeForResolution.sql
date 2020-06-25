SELECT AVG(re.creation_date - r.resolution_date) FROM resolution r
INNER JOIN record re
ON re.resolution_id = r.id
WHERE r.resolution_date IS NOT NULL;
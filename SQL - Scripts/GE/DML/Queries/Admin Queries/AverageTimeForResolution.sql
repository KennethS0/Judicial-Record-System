-- Shows the average time for a resolution (If a record doesn't have one then it is not counted.)
SELECT AVG(psp.date_submitted - r.resolution_date) AS AVERAGE_IN_DAYS FROM resolution r

-- Joins with RECORD (re) to get the corresponding resolution
INNER JOIN record re
ON re.resolution_id = r.id

-- Joins with PERSON_SUES_PERSON (psp) to get the date_submitted
INNER JOIN person_sues_person psp
ON psp.id = re.sue_id

-- Condition to not get NULL data
WHERE r.resolution_date IS NOT NULL;
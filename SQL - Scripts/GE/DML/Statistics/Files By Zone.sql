SELECT COUNT(*) total, 
       NVL(prov.name, '')||', '||NVL(can.name, '')||', '||NVL(d.name, '')||', '||NVL(com.name, '') zone
FROM record r

INNER JOIN person_sues_person psp
ON r.sue_id = psp.id

INNER JOIN person p
ON p.citizenship_id = psp.defendant

INNER JOIN address a
ON p.address_id = a.id

LEFT JOIN community com
ON a.community_id = com.id

LEFT JOIN district d
ON com.district_id = d.id

LEFT JOIN canton can
ON d.canton_id = can.id

LEFT JOIN province prov
ON can.province_id = prov.id

WHERE prov.name = NULL OR can.name = NULL OR d.name = NULL OR com.name = NULL
GROUP BY NVL(prov.name, ''), NVL(can.name, ''), NVL(d.name, ''), NVL(com.name, '')
ORDER BY total desc
;
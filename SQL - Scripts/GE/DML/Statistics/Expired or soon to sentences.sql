SELECT COUNT(id) AS expired,
       ((COUNT(*) * 100) / (SELECT COUNT(*) FROM sentence)) AS percentage,
       (SELECT COUNT(*) FROM sentence) AS total
       FROM sentence
WHERE final_date < TO_DATE('1/DEC/2012', 'DD/MM/YYYY') OR 
final_date BETWEEN TO_DATE('1/DEC/2012', 'DD/MM/YYYY') AND TO_DATE('1/DEC/2015', 'DD/MM/YYYY')
GROUP BY 1;
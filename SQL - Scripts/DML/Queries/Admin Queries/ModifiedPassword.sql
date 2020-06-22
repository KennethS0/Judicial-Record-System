SELECT UNIQUE(ua.username) FROM passwordhistory ph
INNER JOIN useraccount ua
ON ua.id = ph.user_id
WHERE ph.creation_date BETWEEN TO_DATE('19/JUN/20', 'dd/mm/yy') AND TO_DATE('21/JUN/20', 'dd/mm/yy');
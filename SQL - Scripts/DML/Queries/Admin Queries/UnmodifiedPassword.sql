SELECT UNIQUE(ua.username) FROM passwordhistory ph
INNER JOIN useraccount ua
ON ua.id = ph.user_id
WHERE ph.creation_date <= SYSDATE - 10;
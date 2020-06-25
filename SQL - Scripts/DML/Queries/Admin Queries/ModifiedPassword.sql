-- Shows all the accounts that have changed their password in a range of dates.
SELECT UNIQUE(ua.username) FROM passwordhistory ph

-- Joins with USERACCOUNT (ua) to get the id inside of PASSWORDHISTORY
INNER JOIN useraccount ua
ON ua.id = ph.user_id

-- Condition to show in a range of two dates.
WHERE ph.creation_date BETWEEN TO_DATE('24/JUN/20', 'dd/mm/yy') AND TO_DATE('24/JUN/20', 'dd/mm/yy') + 1; 
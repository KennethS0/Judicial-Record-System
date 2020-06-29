-- Shows all the unmodified passwords from the past 10 days.
SELECT UNIQUE(ua.username) FROM passwordhistory ph

-- Joins with USERACCOUNT(ua) to get the corresponding id's
INNER JOIN useraccount ua
ON ua.id = ph.user_id

-- Condition to show only passwords created more than 10 days ago.
WHERE ph.creation_date <= SYSDATE - 10; 
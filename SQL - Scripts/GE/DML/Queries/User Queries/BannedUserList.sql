SELECT useraccount.username, ban.description_
FROM ban
INNER JOIN useraccount
ON ban.user_id = useraccount.ID;
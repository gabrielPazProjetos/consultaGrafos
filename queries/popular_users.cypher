MATCH (u:User)<-[:FOLLOWS]-(:User)
RETURN u.username, COUNT(*) AS seguidores
ORDER BY seguidores DESC;

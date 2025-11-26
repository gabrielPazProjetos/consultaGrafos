MATCH (c:Channel)<-[:SUBSCRIBED_TO]-(:User)
RETURN c.name, COUNT(*) AS inscritos
ORDER BY inscritos DESC;

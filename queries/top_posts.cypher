MATCH (p:Post)<-[:LIKED]-(:User)
RETURN p.title, COUNT(*) AS curtidas
ORDER BY curtidas DESC;

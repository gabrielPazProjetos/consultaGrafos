MATCH (u:User)-[:LIKED|COMMENTED]->(p:Post)-[:HAS_TAG]->(t:Tag)
RETURN t.name, COLLECT(DISTINCT u.username) AS membros;

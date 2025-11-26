MATCH path = shortestPath((a:User {username:'Alice'})-[:FOLLOWS*]-(b:User {username:'Eva'}))
RETURN path;

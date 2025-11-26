// Usuários
CREATE (alice:User {username:'Alice', country:'BR', age:25});
CREATE (bob:User {username:'Bob', country:'US', age:30});
CREATE (carol:User {username:'Carol', country:'BR', age:28});
CREATE (dave:User {username:'Dave', country:'UK', age:35});
CREATE (eva:User {username:'Eva', country:'DE', age:22});

// Canais
CREATE (channel1:Channel {name:'TechWorld', category:'Tecnologia'});
CREATE (channel2:Channel {name:'MusicVibes', category:'Música'});
CREATE (channel3:Channel {name:'TravelNow', category:'Viagens'});

// Vídeos
CREATE (video1:Post {title:'Introdução ao Neo4j', date:date('2025-01-01'), views:5000});
CREATE (video2:Post {title:'Top Hits 2025', date:date('2025-02-01'), views:20000});
CREATE (video3:Post {title:'Explorando o Brasil', date:date('2025-03-01'), views:8000});

// Tags
CREATE (tagTech:Tag {name:'Graph Databases'});
CREATE (tagMusic:Tag {name:'Pop Music'});
CREATE (tagTravel:Tag {name:'Adventure'});

// Relações
CREATE (alice)-[:FOLLOWS]->(bob);
CREATE (carol)-[:FOLLOWS]->(alice);
CREATE (dave)-[:FOLLOWS]->(bob);
CREATE (eva)-[:FOLLOWS]->(carol);

CREATE (alice)-[:SUBSCRIBED_TO]->(channel1);
CREATE (bob)-[:SUBSCRIBED_TO]->(channel2);
CREATE (carol)-[:SUBSCRIBED_TO]->(channel1);
CREATE (dave)-[:SUBSCRIBED_TO]->(channel3);
CREATE (eva)-[:SUBSCRIBED_TO]->(channel2);

CREATE (channel1)-[:CREATED]->(video1);
CREATE (channel2)-[:CREATED]->(video2);
CREATE (channel3)-[:CREATED]->(video3);

CREATE (alice)-[:LIKED]->(video1);
CREATE (bob)-[:LIKED]->(video1);
CREATE (carol)-[:LIKED]->(video2);
CREATE (dave)-[:LIKED]->(video3);
CREATE (eva)-[:LIKED]->(video2);

CREATE (alice)-[:COMMENTED {text:'Ótima explicação!'}]->(video1);
CREATE (bob)-[:COMMENTED {text:'Adorei essa música!'}]->(video2);
CREATE (carol)-[:COMMENTED {text:'Quero visitar esse lugar!'}]->(video3);

CREATE (video1)-[:HAS_TAG]->(tagTech);
CREATE (video2)-[:HAS_TAG]->(tagMusic);
CREATE (video3)-[:HAS_TAG]->(tagTravel);

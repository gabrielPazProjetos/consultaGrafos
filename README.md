--- Banco de Dados de Grafos para Rede Social (YouTube) - Bootcamp DIO
Este projeto foi desenvolvido como parte do **Bootcamp de Análise de Dados com Grafos da DIO** em parceria com **Neo4j**.  
O objetivo é criar um **banco de dados de grafos** que simule uma rede social de vídeos (inspirada no YouTube), permitindo consultas sobre conexões, engajamento e comunidades de interesse.

--- Tecnologias Utilizadas
- **Neo4j** → Banco de dados orientado a grafos
- **Cypher Query Language** → Linguagem de consulta para grafos
- **Python (neo4j-driver)** → Integração com o banco

--- Modelagem do Grafo
-- Nós (Nodes)
- `User` → representa usuários da rede social
- `Channel` → representa canais de criadores
- `Post` → representa vídeos publicados
- `Tag` → representa categorias ou tópicos

-- Relações (Relationships)
- `(User)-[:FOLLOWS]->(User)` → usuário segue outro
- `(User)-[:SUBSCRIBED_TO]->(Channel)` → usuário inscrito em canal
- `(Channel)-[:CREATED]->(Post)` → canal publica vídeo
- `(User)-[:LIKED]->(Post)` → usuário curte vídeo
- `(User)-[:COMMENTED]->(Post)` → usuário comenta vídeo
- `(Post)-[:HAS_TAG]->(Tag)` → vídeo associado a uma categoria/tópico

--- Script de Seed (data/seed.cypher)

O arquivo `seed.cypher` popula o banco com **usuários, canais, vídeos e tags fictícias**, além de criar as conexões entre eles.  
Exemplo de dados inseridos:
- Usuários: Alice, Bob, Carol, Dave, Eva (Sugeridos aleatoriamente com base em minhas pesquisas de nomes mais comuns em repositorios)
- Canais: TechWorld, MusicVibes, TravelNow
- Vídeos: Introdução ao Neo4j, Top Hits 2025, Explorando o Brasil
- Tags: Graph Databases, Pop Music, Adventure

--- Consultas (queries/)

-- Usuários mais populares (seguidores):
  cypher
  MATCH (u:User)<-[:FOLLOWS]-(:User)
  RETURN u.username, COUNT(*) AS seguidores
  ORDER BY seguidores DESC;
  
-- Canais mais inscritos:
cypher
MATCH (c:Channel)<-[:SUBSCRIBED_TO]-(:User)
RETURN c.name, COUNT(*) AS inscritos
ORDER BY inscritos DESC;

-- Vídeos mais engajados (likes):
cypher
MATCH (p:Post)<-[:LIKED]-(:User)
RETURN p.title, COUNT(*) AS curtidas
ORDER BY curtidas DESC;

-- Comunidades de interesse (hashtags/tags):
cypher
MATCH (u:User)-[:LIKED|COMMENTED]->(p:Post)-[:HAS_TAG]->(t:Tag)
RETURN t.name, COLLECT(DISTINCT u.username) AS membros;

-- Caminho mais curto entre dois usuários:
cypher
MATCH path = shortestPath((a:User {username:'Alice'})-[:FOLLOWS*]-(b:User {username:'Eva'}))
RETURN path;

--- Integração com Python (src/exemplo_python.py)
O script Python conecta ao Neo4j e executa consultas de forma programática.
-- Exemplo de uso:
-- python
with driver.session() as session:
    print("Usuários mais populares:")
    session.read_transaction(popular_users)
    print("\nPosts mais engajados:")
    session.read_transaction(top_posts)

--- Nota de segurança
--  O file .py foi feito usando variáveis de ambiente em vez de credenciais expostas, para garantir segurança.
  RETURN u.username, COUNT(*) AS seguidores
  ORDER BY seguidores DESC;

import os
from neo4j import GraphDatabase
from dotenv import load_dotenv

load_dotenv()

uri = os.getenv("NEO4J_URI", "bolt://localhost:7687")
user = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD")

driver = GraphDatabase.driver(uri, auth=(user, password))

def popular_users(tx):
    query = """
    MATCH (u:User)<-[:FOLLOWS]-(:User)
    RETURN u.username, COUNT(*) AS seguidores
    ORDER BY seguidores DESC
    """
    for record in tx.run(query):
        print(record["u.username"], record["seguidores"])

def top_posts(tx):
    query = """
    MATCH (p:Post)<-[:LIKED]-(:User)
    RETURN p.title, COUNT(*) AS curtidas
    ORDER BY curtidas DESC
    """
    for record in tx.run(query):
        print(record["p.title"], record["curtidas"])

with driver.session() as session:
    print("Usuários mais populares:")
    session.read_transaction(popular_users)
    print("\nPosts mais engajados:")
    session.read_transaction(top_posts)

driver.close()


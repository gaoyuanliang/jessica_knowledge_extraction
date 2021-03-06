#####jessica_knowledge_extraction_to_neo4j.py#####
from yan_neo4j import start_neo4j
from yan_neo4j import create_neo4j_session
from yan_neo4j import ingest_knowledge_triplets_to_neo4j

start_neo4j(http_port = "4567", bolt_port = "8765")
neo4j_session = create_neo4j_session(bolt_port = "8765")

from jessica_relation_extraction import relation_extraction

def knowwledge_extraction_to_neo4j(text):
	ingest_knowledge_triplets_to_neo4j(relation_extraction(text), neo4j_session)

'''
text = u"""
Jessica Liang works for Group 42 Inc. She was born in China. She studies at Jiangsu University of Science and Technology. Jessica is married to Smith.
"""

ingest_knowledge_triplets_to_neo4j(relation_extraction(text), neo4j_session)
'''
#####jessica_knowledge_extraction_to_neo4j.py#####

//map and clean rdf classes
CALL n10s.graphconfig.init({
  handleVocabUris: "SHORTEN",
  handleMultival: "ARRAY"
});

//create unique constraint
CREATE CONSTRAINT n10s_unique_uri FOR (r:Resource) REQUIRE r.uri IS UNIQUE

//import hint schema into neo4j
CALL n10s.rdf.import.fetch("file:///C:/Users/24990576/.Neo4jDesktop/relate-data/dbmss/dbms-112b720d-b8cf-4259-a592-fc7e633f4ae5/import/hint_schema_rdf.ttl", "Turtle");


## Files Included

- `toco_schema_rdf.ttl`: Ontology schema using ToCo RDF/Turtle terms, loaded via Neo4j `n10s` plugin.
- `toco_data_creation.cypher`: Inserts example data including Device, AccessPoint, Connection, Service, QoS.
- `toco_queries_usecases.cypher`: Cypher queries for handover simulation and service QoS checks.

## How to Use

1. Start Neo4j with the APOC and `n10s` plugins enabled.
2. Import and execute `toco_schema_rdf.ttl` to define the schema.
3. Run `toco_data_creation.cypher` to populate the dataset.
4. Use `toco_queries_usecases.cypher` to simulate 4G HO scenarios and QoS evaluations.

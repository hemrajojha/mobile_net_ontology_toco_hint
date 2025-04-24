## Files Included

## toco
- `toco_schema_rdf.ttl`: Ontology schema using ToCo RDF/Turtle terms, loaded via Neo4j `n10s` plugin.
- `toco_data_creation.cypher`: Inserts example data including Device, AccessPoint, Connection, Service, QoS.
- `toco_queries_usecases.cypher`: Cypher queries for handover simulation and service QoS checks.

## hint
- `hint_schema_rdf.ttl`: Ontology schema using ToCo RDF/Turtle terms, loaded via Neo4j `n10s` plugin.
- `hint_data_creation.cypher`: Inserts example data including Device, AccessPoint, Connection, Service, QoS.
- `hint_queries_usecases.cypher`: Cypher queries for handover simulation and service QoS checks.

## How to Use

## toco
1. Start Neo4j with the APOC and `n10s` plugins enabled.
2. Import and execute `hint_schema_rdf.ttl` to define the schema using steps in import_hint_rdf_schema.cypher.
3. Run `hint_data_creation.cypher` to populate the dataset.
4. Use `hint_queries_usecases.cypher` to simulate devices scenarios and QoS evaluations.

## hint
1. Start Neo4j with the APOC and `n10s` plugins enabled.
2. Import and execute `toco_schema_rdf.ttl` to define the schema.
3. Run `toco_data_creation.cypher` to populate the dataset.
4. Use `toco_queries_usecases.cypher` to simulate 4G HO scenarios and QoS evaluations.

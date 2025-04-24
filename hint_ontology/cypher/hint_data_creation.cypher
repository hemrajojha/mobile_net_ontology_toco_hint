//create nodes (devices, access points, receiver, signals, network slices and quality of services)
CREATE (ue1:UserEquipment {id: 'UE1'});
CREATE (ap1:AccessPoint {id: 'AP1'}), (ap2:AccessPoint {id: 'AP2'});
CREATE (recv:Receiver {id: 'Rx1'}), (send:Sender {id: 'Tx1'});
CREATE (signal:Signal {id: 'SIG1', strength: -80}), (q:Quality {snr: 22});
CREATE (slice:NetworkSlice {id: 'SLICE1'}), (svc:Service {id: 'SVC1', name: 'Video Streaming'});
CREATE (qos:QualityOfService {latency: '4ms'}), (pol:Policy {description: 'Streaming Policy'});

//create HAS_INTERFACE, SELECTED_AP, MONITORED_AP relationships
MATCH (ue1:UserEquipment{id:"UE1"}), (recv:Receiver {id: 'Rx1'}), (ap1:AccessPoint {id: 'AP1'}), (ap2:AccessPoint {id: 'AP2'})
MERGE (ue1)-[:HAS_INTERFACE]->(recv)
MERGE (ue1)-[:SELECTED_AP]->(ap1)
MERGE (ue1)-[:MONITORED_AP]->(ap2);

//create HAS_INTERFACE relationships
MATCH (ap1:AccessPoint {id: 'AP1'}), (send:Sender {id: 'Tx1'})
MERGE (ap1)-[:HAS_INTERFACE]->(send);

//create TRANSMITS, HAS_QUALITY, RECEIVES, DECODES relationships
MATCH (send:Sender {id: 'Tx1'}), (signal:Signal {id: 'SIG1'}), (q:Quality), (recv:Receiver {id: 'Rx1'})
MERGE (send)-[:TRANSMITS]->(signal)
MERGE (signal)-[:HAS_QUALITY]->(q)
MERGE (recv)-[:RECEIVES]->(signal)
MERGE (recv)-[:DECODES]->(send);

//creates PROVIDES, HAS_QOS, GOVERNED_BY relationships
MATCH (slice:NetworkSlice {id: 'SLICE1'}), (svc:Service {id: 'SVC1'}), (qos:QualityOfService), (pol:Policy)
MERGE (slice)-[:PROVIDES]->(svc)
MERGE (slice)-[:HAS_QOS]->(qos)
MERGE (slice)-[:GOVERNED_BY]->(pol);






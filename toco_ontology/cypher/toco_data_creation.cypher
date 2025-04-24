//create nodes (devices, access points, connections, location, service, quality of service and policy)
CREATE (ue:Device {id: 'UE1', type: 'UserEquipment'});
CREATE (ap1:AccessPoint {id: 'AP1'});
CREATE (ap2:AccessPoint {id: 'AP2'});
CREATE (conn:Connection {id: 'CONN1', status: 'active'});
CREATE (loc1:Location {id: 'LOC1', name: 'Sector A'});
CREATE (loc2:Location {id: 'LOC2', name: 'Sector B'});
CREATE (svc1:Service {id: 'SVC1', name: 'Live Video'});
CREATE (qos1:QoS {latency: '4ms', bandwidth: '200Mbps'});
CREATE (pol1:Policy {id: 'POL1', description: 'HO Aware'});

//create hasConnection relationship
match (ue:Device{id:"UE1"}),(conn:Connection{id:"CONN1"})
create (ue)-[:hasConnection]->(conn);

//create connectedTO relationship
MATCH (conn:Connection{id:"CONN1"}),(ap1:AccessPoint{id:"AP1"})
MERGE (conn)-[:connectedTo]->(ap1);

//create locatedAt relationships
MATCH (ue:UserEquipment{id:"UE1"}),(loc1:Location{id:"LOC1"})
match (ap1:AccessPoint{id:"AP1"}),(loc1:Location{id:"LOC1"})
match (ap2:AccessPoint{id:"AP2"}),(loc2:Location{id:"LOC2"})
create (ue)-[:locatedAt]->(loc1);
create (ap1)-[:locatedAt]->(loc1);
create (ap2)-[:locatedAt]->(loc2);

//create hasQoS relationship
MATCH (svc1:Service{id:"SVC1"}),(qos1:QoS)
CREATE (svc1)-[:hasQoS]->(qos1);

//create governedBy realtionship
MATCH (svc1:Service{id:"SVC1"}),(pol1:Policy{id:"POL1"})
MERGE (svc1)-[:governedBy]->(pol1);

//create usesService realtionship
MATCH (ue:Device{id:"UE1"}),(svc1:Service{id:"SVC1"})
MERGE (ue)-[:usesService]->(svc1);








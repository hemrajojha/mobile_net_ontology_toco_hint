//devices, active connections and access points
MATCH (d:Device {id: 'UE1'})-[:hasConnection]->(c:Connection)-[:connectedTo]->(ap:AccessPoint)
WHERE c.status = 'active'
RETURN d,c,ap;

//devices and locations
MATCH (d:Device)-[:locatedAt]->(l:Location)
RETURN d, l;

//available access points
MATCH (ap:AccessPoint)<-[:connectedTo]-(c:Connection)
WITH COLLECT(ap.id) AS connectedAPs
MATCH (a:AccessPoint)
WHERE NOT a.id IN connectedAPs
RETURN a.id AS AvailableAccessPoint;

//services and latencies
MATCH (s:Service)-[:hasQoS]->(q:QoS)
WHERE toInteger(replace(q.latency, 'ms', '')) < 5
RETURN s.name AS Service, q.latency AS Latency;

//services and policies
MATCH (s:Service {id: 'SVC1'})-[:governedBy]->(p:Policy)
RETURN s.name AS Service, p.description AS Policy;

//full network
MATCH (n)
RETURN n;

//devices and signals having strength less than -70
MATCH (ue:UserEquipment)-[:HAS_INTERFACE]->(recv:Receiver)-[:RECEIVES]->(s:Signal)
WHERE s.strength < -70
RETURN ue, recv, s;

//devices and selected access points
MATCH (ue:UserEquipment)-[:SELECTED_AP]->(ap:AccessPoint)
RETURN ue.id AS UE, ap.id AS SelectedAccessPoint;

//devices and monitored access points
MATCH (ue:UserEquipment)-[:MONITORED_AP]->(ap:AccessPoint)
RETURN ue.id AS UE, collect(ap.id) AS MonitoredCandidates;

//receiver and senders transmitting signal strength (snr) greater than or equal to 20
MATCH (recv:Receiver)-[:DECODES]->(sender:Sender),
      (recv)-[:RECEIVES]->(sig:Signal)-[:HAS_QUALITY]->(q:Quality)
WHERE q.snr >= 20
RETURN recv.id AS Receiver, sender.id AS Sender, q.snr AS SNR;

//network slice governed by policy
MATCH (ns:NetworkSlice)-[:GOVERNED_BY]->(p:Policy)
RETURN ns.id AS Slice, p.description AS Policy;

//service providing network with quality of service latency less than or equal to 5
MATCH (s:Service)<-[:PROVIDES]-(ns:NetworkSlice)-[:HAS_QOS]->(q:QualityOfService)
WHERE toInteger(replace(q.latency, 'ms', '')) <= 5
RETURN s.name AS Service, q.latency AS Latency;

//full network
MATCH (n) 
RETURN n;

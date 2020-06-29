class CollecteRest {
  int client;
  int agent;
  int somme;
  int depot;


  CollecteRest(this.client, this.agent, this.somme, this.depot);

  CollecteRest.fromMap(Map<String, dynamic> map):
    client = map['client'],
    agent = map['agent'],
    somme = map['somme'],
    depot = map['depot'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client'] = client;
    data['agent'] = agent;
    data['somme'] = somme;
    data['depot'] = depot;
    return data;
  }
}
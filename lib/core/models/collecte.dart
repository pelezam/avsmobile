import 'package:floor/floor.dart';
import 'package:mobile/core/models/agent.dart';
import 'package:mobile/core/models/client.dart';

@entity
class Collecte {

	@PrimaryKey(autoGenerate: true)
  final int id;
  final int client;
  final int agent;
  final int somme;
  final int depot;
  @ignore
	Client clientObject;
  @ignore
  Agent agentObject;

	Collecte(this.id, this.client, this.agent, this.somme, this.depot);

	Collecte.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		client = map["client"],
		agent = map["agent"],
		somme = map["somme"],
		depot = map["depot"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['client'] = client;
		data['agent'] = agent;
		data['somme'] = somme;
		data['depot'] = depot;
		return data;
	}
}

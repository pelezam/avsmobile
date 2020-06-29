import 'package:floor/floor.dart';

@entity
class Agent {

	@primaryKey
  final int id;
  final String last_name;
  final String first_name;
  final String username;
  final String email;
  final String adresse;
  final String telephone;
  final String type_agent;


	Agent(this.id, this.last_name, this.first_name, this.username, this.email,
			this.adresse, this.telephone, this.type_agent);


	@override
	bool operator ==(Object other) => other is Agent && id == other.id;

	@override
	int get hashCode => 0;

	Agent.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		last_name = map["last_name"],
		first_name = map["first_name"],
		username = map["username"],
		email = map["email"],
		adresse = map["adresse"],
		telephone = map["telephone"],
		type_agent = map["type_agent"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['last_name'] = last_name;
		data['first_name'] = first_name;
		data['username'] = username;
		data['email'] = email;
		data['adresse'] = adresse;
		data['telephone'] = telephone;
		data['type_agent'] = type_agent;
		return data;
	}
}

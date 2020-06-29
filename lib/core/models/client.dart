
import 'package:floor/floor.dart';
import 'package:mobile/core/models/user.dart';

@entity
class Client {

	@primaryKey
  int id;
  String numero;
  String photo;
  String date_naissance;
  String profession;
  String nationalite;
  String nom_conjoint;
  String cni;
  String beneficiaire;
  String procurateur;
  String personne_reference;
  String lieu_travail;
  String contact;
  String adresse;
  String created_at;
  String updated_at;
  int mise;
  int agent;
  int suivi_par;
  int zone;
  int user;
  @ignore
  User userObject = null;

	Client(this.id, this.numero, this.photo, this.date_naissance, this.profession, this.nationalite, this.nom_conjoint, this.cni, this.beneficiaire,
			this.procurateur, this.personne_reference, this.lieu_travail, this.contact, this.adresse, this.created_at, this.updated_at, this.mise,
			this.agent, this.suivi_par, this.zone, this.user);

	Client.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		numero = map["numero"],
		photo = map["photo"],
		date_naissance = map["date_naissance"],
		profession = map["profession"],
		nationalite = map["nationalite"],
		nom_conjoint = map["nom_conjoint"],
		cni = map["cni"],
		beneficiaire = map["beneficiaire"],
		procurateur = map["procurateur"],
		personne_reference = map["personne_reference"],
		lieu_travail = map["lieu_travail"],
		contact = map["contact"],
		adresse = map["adresse"],
		created_at = map["created_at"],
		updated_at = map["updated_at"],
		mise = map["mise"],
		agent = map["agent"],
		suivi_par = map["suivi_par"],
		zone = map["zone"],
		user = map["user"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['numero'] = numero;
		data['photo'] = photo;
		data['date_naissance'] = date_naissance;
		data['profession'] = profession;
		data['nationalite'] = nationalite;
		data['nom_conjoint'] = nom_conjoint;
		data['cni'] = cni;
		data['beneficiaire'] = beneficiaire;
		data['procurateur'] = procurateur;
		data['personne_reference'] = personne_reference;
		data['lieu_travail'] = lieu_travail;
		data['contact'] = contact;
		data['adresse'] = adresse;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		data['mise'] = mise;
		data['agent'] = agent;
		data['suivi_par'] = suivi_par;
		data['zone'] = zone;
		data['user'] = user;
		return data;
	}
}

import 'package:floor/floor.dart';
import 'package:mobile/core/models/images.dart';

@entity
class Product {

	@primaryKey
  final int id;
  final String libelle;
  final String categorie;
  final int prix;
  final String created_at;
  final String status;
  @ignore
  List<Images> images;


	Product(this.id, this.libelle, this.categorie, this.prix,
			this.created_at, this.status);

	Product.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		libelle = map["libelle"],
		images = List<Images>.from(map["images"].map((it) => Images.fromJsonMap(it))),
		categorie = map["categorie"],
		prix = map["prix"],
		created_at = map["created_at"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['libelle'] = libelle;
		data['images'] = images != null ? 
			this.images.map((v) => v.toJson()).toList()
			: null;
		data['categorie'] = categorie;
		data['prix'] = prix;
		data['created_at'] = created_at;
		data['status'] = status;
		return data;
	}
}

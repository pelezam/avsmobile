
import 'package:floor/floor.dart';

@entity
class User {

	@primaryKey
  int id;
  String last_login;
  bool is_superuser;
  String username;
  String first_name;
  String last_name;
  String email;
  bool is_staff;
  bool is_active;
  String date_joined;
  @ignore
  List<Object> groups = [];
  @ignore
  List<Object> user_permissions = [];


	User(this.id, this.last_login, this.is_superuser, this.username, this.first_name, this.last_name, this.email, this.is_staff,
			this.is_active, this.date_joined);

	User.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		last_login = map["last_login"],
		is_superuser = map["is_superuser"],
		username = map["username"],
		first_name = map["first_name"],
		last_name = map["last_name"],
		email = map["email"],
		is_staff = map["is_staff"],
		is_active = map["is_active"],
		date_joined = map["date_joined"],
		groups = map["groups"],
		user_permissions = map["user_permissions"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['last_login'] = last_login;
		data['is_superuser'] = is_superuser;
		data['username'] = username;
		data['first_name'] = first_name;
		data['last_name'] = last_name;
		data['email'] = email;
		data['is_staff'] = is_staff;
		data['is_active'] = is_active;
		data['date_joined'] = date_joined;
		data['groups'] = groups;
		data['user_permissions'] = user_permissions;
		return data;
	}
}

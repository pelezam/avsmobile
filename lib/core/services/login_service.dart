import 'dart:convert';

import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/client.dart';
import 'package:mobile/core/models/product.dart';
import 'package:mobile/core/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<bool> login(username, password) async {
    return true;
    try {
      var data = await ApiService.get('/users?username=$username&password=$password');
      var users = json.decode(data) as List;
      return users.isEmpty ? false : true;
    } catch (e) {
       print(e);
        return false;
    }
  }
}

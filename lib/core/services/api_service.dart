import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
//  static final baseUrl = "http://192.168.1.65:3000";
  static get(String url) async {
    try {
      final baseUrl = await _getServerAddress();
      final response = await http.get(baseUrl + url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Error");
      }
    } on SocketException {
      throw Exception("Le serveur est injoignable");
    }
  }

  static post(String url, dynamic body) async {
    try {
      final baseUrl = await _getServerAddress();
      final response = await http.post(baseUrl + url, body: body);
      if (response.statusCode == 200) {
        return response.body;
      } else if(response.statusCode == 500) {
        throw Exception('Une erreur est survenue, veuillez reésayer plustard');
      } else {
        throw Exception(json.decode(response.body));
      }
    } on SocketException {
      throw Exception("Le serveur est injoignable");
    }
  }

  static put() {

  }

  static delete() {

  }

  static _getServerAddress() async {
    return (await SharedPreferences.getInstance()).getString('address');
  }
}
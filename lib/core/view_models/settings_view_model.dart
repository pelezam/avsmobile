import 'package:flutter/cupertino.dart';
import 'package:mobile/core/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends ChangeNotifier {

  String _serverAddressPrefKey = 'address';
  String serverAddress;

  SettingsViewModel() {
    getServerAdress();
  }

  Future<void> getServerAdress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (serverAddress == null) {
      serverAddress = prefs.getString(_serverAddressPrefKey);
      notifyListeners();
    }
  }

  Future<void> saveServerAdress(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_serverAddressPrefKey, address);
    serverAddress = address;
    notifyListeners();
  }
}

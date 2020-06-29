import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/core/services/api_service.dart';
import 'package:mobile/core/services/sync_service.dart';
import 'package:mobile/core/view_models/settings_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncViewModel extends ChangeNotifier {

  bool _alreadySynced = false;

  Future<void> synchronize(SettingsViewModel settingsViewModel, bool force) async {
    if (!_alreadySynced || force) {
      await showToast('Synchronisation en cours...');
      await settingsViewModel.getServerAdress();
      var result = await SyncService.synchronize();
      _alreadySynced = true;
      if (result) {
        await showToast('Synchronisation terminée');
      } else {
        await showToast('Echec de la synchronisation', color: Colors.red);
      }
    }
    notifyListeners();
  }

  showToast(String message, {Color color: Colors.green}) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  closeToast() {

  }
}

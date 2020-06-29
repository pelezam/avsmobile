import 'package:flutter/cupertino.dart';
import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/client.dart';
import 'package:mobile/core/services/sync_service.dart';

class ClientsViewModel extends ChangeNotifier {
  bool isOverlyDisplayed = false;
  List<Client> clients = [];
  List<Client> clientsFiltred = [];

  getAllClients() async {
    if (clients.isEmpty) {
      clients = await Db.instance.clientDao.findAllClients();
      clientsFiltred = List.from(clients);
      notifyListeners();
    }
  }

  saveClients(List<Client> clients) async {
    return await Db.instance.clientDao.insertClients(clients);
  }

  filterClients(String text) {
    if (text == '') {
      clientsFiltred = List.from(clients);
    } else {
      clientsFiltred = clients.where((client) {
        final str = client.numero.toLowerCase();
        return str.indexOf(text) >= 0;
      }).toList();
    }
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:mobile/core/db/dao/client_dao.dart';
import 'package:mobile/core/db/dao/collect_dao.dart';
import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/client.dart';
import 'package:mobile/core/models/collecte.dart';

class CollectViewModel extends ChangeNotifier {
  bool isOverlyDisplayed = false;
  CollectDao _collectDao = Db.instance.collectDao;
  ClientDao _clientDao = Db.instance.clientDao;
  List<Collecte> collects = [];

  Future<void> getAllCollects() async {
    collects = await _collectDao.findAllCollects();
    notifyListeners();
  }

  Stream<Client> getClient(int id) {
    return _clientDao.findClientById(id);
  }

  saveCollect(Collecte collect) async {
    final id = await _collectDao.insertCollect(collect);
    // todo change depot number please
    var c = Collecte(id, collect.client, collect.agent, collect.somme, 6);
    collects.add(c);
    notifyListeners();
  }
}

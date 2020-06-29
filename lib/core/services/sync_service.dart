import 'dart:convert';

import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/client.dart';
import 'package:mobile/core/models/collecte_rest.dart';
import 'package:mobile/core/models/product.dart';
import 'package:mobile/core/models/user.dart';
import 'package:mobile/core/services/api_service.dart';

class SyncService {
  static Future<bool> synchronize() async {
    try {
      await _sendCollects();
      await _getClients();
      await _getUsers();
//      await _getProducts();
      return true;
    } catch (e) {
       print(e);
      return false;
    }
  }

  static _getUsers() async {
    final db = Db.instance;
    var data = await ApiService.get('/api/users');
    var list = json.decode(data) as List;
    var users = list.map((user) => User.fromJsonMap(user)).toList();
    await _createUsers(db, users);
  }

  static _sendCollects() async {
    try {
      final db = Db.instance;
      final collects = await db.collectDao.findAllCollects();
      final collectsRest = collects.map((collect) => CollecteRest(collect.client, collect.agent, collect.somme, 6).toJson()).toList();
      var data = await ApiService.post('/api/cotisations/', jsonEncode(collectsRest));
      print(data);
      await db.collectDao.deleteAllCollects();
    } catch(e) {
      print(e);
    }


//    var list = json.decode(data) as List;
//    var clients = list.map((client) {
//      var c = Client.fromJsonMap(client);
//      c.agentId = c.agent.id;
//      return c;
//    }).toList();
//    var agents = clients.map((client) => client.agent).toSet().toList();
//    await _createClients(db, clients);
//    await _createAgents(db, agents);
  }

  static _getClients() async {
    final db = Db.instance;
    var data = await ApiService.get('/api/clients');
    var list = json.decode(data) as List;
    var clients = list.map((client) => Client.fromJsonMap(client)).toList();
    await _createClients(db, clients);
  }

  static _getProducts() async {
    final db = Db.instance;
    var data = await ApiService.get('/api/products');
    var list = json.decode(data) as List;
    var products = list.map((product) => Product.fromJsonMap(product)).toList();
    await _createProducts(db, products);
  }

  static _createProducts(Db db, products) async {
    await db.productDao.deleteAllProducts();
    await db.productDao.insertProducts(products);
  }

  static _createClients(Db db, clients) async {
    await db.clientDao.deleteAllClients();
    await db.clientDao.insertClients(clients);
  }

  static _createUsers(Db db, users) async {
    await db.userDao.deleteAllUsers();
    await db.userDao.insertUsers(users);
  }

  static _createAgents(Db db, agents) async {
    await db.agentDao.deleteAllAgents();
    await db.agentDao.insertAgents(agents);
  }

}

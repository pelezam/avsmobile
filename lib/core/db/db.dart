
import 'package:mobile/core/db/dao/agent_dao.dart';
import 'package:mobile/core/db/dao/client_dao.dart';
import 'package:mobile/core/db/dao/collect_dao.dart';
import 'package:mobile/core/db/dao/product_dao.dart';
import 'package:mobile/core/db/dao/user_dao.dart';
import 'package:mobile/core/models/agent.dart';
import 'package:mobile/core/models/client.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:mobile/core/models/collecte.dart';
import 'package:mobile/core/models/images.dart';
import 'package:mobile/core/models/product.dart';
import 'package:mobile/core/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'db.g.dart';

@Database(version: 1, entities: [Client, Agent, Images, Product, Collecte, User])
abstract class Db extends FloorDatabase {
  ClientDao get clientDao;
  AgentDao get agentDao;
  ProductDao get productDao;
  CollectDao get collectDao;
  UserDao get userDao;

  static Db instance;
}
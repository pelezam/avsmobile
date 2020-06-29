import 'package:flutter/cupertino.dart';
import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/client.dart';
import 'package:mobile/core/models/user.dart';
import 'package:mobile/core/services/sync_service.dart';

class UserViewModel extends ChangeNotifier {
  bool isOverlyDisplayed = false;
  List<User> users = [];

  UserViewModel() {
    getAllUsers();
  }

  getAllUsers() async {
    users = await Db.instance.userDao.findAllUsers();
    notifyListeners();
  }

  saveUsers(List<User> users) async {
    return await Db.instance.userDao.insertUsers(users);
  }
}

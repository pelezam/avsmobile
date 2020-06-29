import 'package:flutter/cupertino.dart';

class BottomNavigationBarViewModel extends ChangeNotifier {

  selectedPage(int index) {
    notifyListeners();
  }
}

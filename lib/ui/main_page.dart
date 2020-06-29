import 'package:flutter/material.dart';
import 'package:mobile/core/view_models/settings_view_model.dart';
import 'package:mobile/core/view_models/sync_view_model.dart';
import 'package:mobile/ui/clients_page.dart';
import 'package:mobile/ui/home_page.dart';
import 'package:mobile/ui/products_page.dart';
import 'package:mobile/ui/settings_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ClientsPage(),
    ProductsPage(),
    SettingsPage()
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var syncViewModel = Provider.of<SyncViewModel>(context, listen: false);
    var settingsViewModel = Provider.of<SettingsViewModel>(context, listen: false);
    syncViewModel.synchronize(settingsViewModel, false);
    return Scaffold(
      body: SafeArea(child: pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Acceuil')),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), title: Text('Clients')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), title: Text('Produits')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Paramètres')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

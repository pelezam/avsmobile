import 'package:flutter/material.dart';
import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/services/sync_service.dart';
import 'package:mobile/core/view_models/bottom_navigationbar_view_model.dart';
import 'package:mobile/core/view_models/clients_view_model.dart';
import 'package:mobile/core/view_models/collect_view_model.dart';
import 'package:mobile/core/view_models/product_view_model.dart';
import 'package:mobile/core/view_models/settings_view_model.dart';
import 'package:mobile/core/view_models/sync_view_model.dart';
import 'package:mobile/ui/main_page.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Db.instance = await $FloorDb.databaseBuilder('collect.db').build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Collect',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(providers: [
          Provider<BottomNavigationBarViewModel>(create: (_) => BottomNavigationBarViewModel()),
          ChangeNotifierProvider<ClientsViewModel>(create: (_) => ClientsViewModel()),
          ChangeNotifierProvider<CollectViewModel>(create: (_) => CollectViewModel()),
          ChangeNotifierProvider<ProductViewModel>(create: (_) => ProductViewModel()),
          ChangeNotifierProvider<SettingsViewModel>(create: (_) => SettingsViewModel()),
          ChangeNotifierProvider<SyncViewModel>(create: (_) => SyncViewModel()),
        ], child: MainPage()));
  }
}

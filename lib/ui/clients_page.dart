import 'package:flutter/material.dart';
import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/user.dart';
import 'package:mobile/core/view_models/clients_view_model.dart';
import 'package:mobile/core/view_models/sync_view_model.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatelessWidget {
  ClientsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClientPageBody();
  }
}

class ClientPageBody extends StatefulWidget {
  const ClientPageBody({
    Key key
  }) : super(key: key);

  @override
  _ClientPageBodyState createState() => _ClientPageBodyState();
}

class _ClientPageBodyState extends State<ClientPageBody> {

  @override
  Widget build(BuildContext context) {
    var clientViewModel = Provider.of<ClientsViewModel>(context);
    clientViewModel.getAllClients();
    return Consumer<SyncViewModel>(
      builder: (context, syncViewModel, _) {
        clientViewModel.getAllClients();
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Rechercher un client'),
                  onChanged: (text) {
                    clientViewModel.filterClients(text);
                  },
                ),
              ),
              Expanded(
                child: Consumer<ClientsViewModel>(builder: (context, clientViewModel, _) {
                  final clients = clientViewModel.clientsFiltred;
                  return ListView.separated(
                      itemCount: clients.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        final client = clients[index];
                        return FutureBuilder<User>(
                          future: Db.instance.userDao.findUserById(client.user),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final user = snapshot.data;
                              return ListTile(
                                title: Text(client.numero),
                                subtitle: Text(user.last_name + ' ' + user.first_name),
                                trailing: Text(client.mise.toString()),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      });
                }),
              )
            ],
          ),
        );
      },
    );
  }
}

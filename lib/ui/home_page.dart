import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/core/models/client.dart';
import 'package:mobile/core/models/collecte.dart';
import 'package:mobile/core/services/login_service.dart';
import 'package:mobile/core/view_models/clients_view_model.dart';
import 'package:mobile/core/view_models/collect_view_model.dart';
import 'package:mobile/core/view_models/settings_view_model.dart';
import 'package:mobile/core/view_models/sync_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchBarController = TextEditingController();
  OverlayEntry overlayEntry;
  FocusNode focusNode = FocusNode();
  OverlayEntry sumToCollectOverlayEntry;
  List<Client> clients;
  OverlayEntry loginOverlay;

  @override
  Widget build(BuildContext context) {
    var clientsViewModel =
        Provider.of<ClientsViewModel>(context, listen: false);
    var collectViewModel =
        Provider.of<CollectViewModel>(context, listen: false);
    collectViewModel.getAllCollects();
    var _usernameController = TextEditingController(text: 'wiz');
    var _passwordController = TextEditingController(text: 'wiz');
    var _mainContext = context;

    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Material(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(7),
                child: InkWell(
                  enableFeedback: true,
                  highlightColor: Colors.yellow,
                  onTap: () {
                    try {
                      loginOverlay.remove();
                    } catch (e) {
                      print(e);
                    }
                    var overlay = Overlay.of(context);
                    loginOverlay = OverlayEntry(builder: (context) {
                      return Stack(
                        children: <Widget>[
                          Positioned.fill(
                              child: Opacity(
                                  opacity: 0.9,
                                  child: Container(color: Colors.blue))),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.3,
                            bottom: MediaQuery.of(context).size.height * 0.3,
                            left: 40,
                            right: 40,
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                        'Veuillez vous connecter afin de procéder à la synchronisation',
                                        style:
                                            Theme.of(context).textTheme.title,
                                        textAlign: TextAlign.center),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      child: Column(
                                        children: <Widget>[
                                          TextField(
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType: TextInputType.text,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .title,
                                              controller: _usernameController,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintText: 'Nom utilisateur',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                              ),
                                              onSubmitted: (sum) {}),
                                          SizedBox(height: 8),
                                          TextField(
                                              obscureText: true,
                                              textInputAction:
                                                  TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .title,
                                              controller: _passwordController,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintText: 'Mot de passe',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                              ),
                                              onSubmitted: (sum) {}),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      OutlineButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          color: Theme.of(context).primaryColor,
                                          child: Text('Annuler'),
                                          onPressed: () {
                                            loginOverlay.remove();
                                          }),
                                      SizedBox(width: 24),
                                      RaisedButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        textColor: Colors.white,
                                        color: Colors.blue,
                                        child: Text('Synchroniser'),
                                        onPressed: () async {
                                          var authenticated =
                                              await LoginService.login(
                                                  _usernameController.text,
                                                  _passwordController.text);
                                          if (authenticated) {
                                            sync(_mainContext);
                                            loginOverlay.remove();
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: 'Authentification échouée',
                                                backgroundColor: Colors.red);
                                          }
                                        },
                                      ),
                                      SizedBox(width: 16)
                                    ],
                                  ),
                                  SizedBox(height: 16)
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    });
                    overlay.insert(loginOverlay);
//                    syncViewModel.synchronize(settings, true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 6,
                            spreadRadius: 0,
                            offset: Offset(0, 6))
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Text('Synchroniser',
                            style: TextStyle(color: Colors.white)),
                        Icon(
                          Icons.sync,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 60,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(
                  'Rechercher un client',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.search,
                          style: Theme.of(context).textTheme.title,
                          controller: _searchBarController,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Numéro du client',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          onChanged: (text) async {
                            if (text == '') {
                              closeClientOverlay();
                            } else {
                              if (clients == null) {
                                clients = clientsViewModel.clients;
                              }
                              final clientsFiltered = clients
                                  .where((client) =>
                                      client.numero.indexOf(text) >= 0)
                                  .toList();
                              displayClients(context, clientsFiltered,
                                  focusNode, clearSearchField);
                            }
                          }),
                    ))
              ]),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Collectes de la journée',
              style: Theme.of(context).textTheme.headline),
        ),
        Expanded(
          child: Consumer<CollectViewModel>(
            builder: (context, collectViewModel, _) {
              final collects = collectViewModel.collects;
              return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: collects.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 7);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final collect = collects[index];
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            )
                          ]),
                      child: StreamBuilder<Client>(
                          stream: collectViewModel.getClient(collect.client),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Text(snapshot.data.numero,
                                        style:
                                            Theme.of(context).textTheme.title),
//                                  SizedBox(height: 10),
//                                  Text(snapshot.data. + ' ' + snapshot.data.first_name, style: Theme.of(context).textTheme.subtitle)
                                  ]),
                                  Text(collect.somme.toString(),
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18))
                                ],
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                    );
                  });
            },
          ),
        )
      ],
    );
  }

  void sync(BuildContext context) {
    var settings = Provider.of<SettingsViewModel>(context, listen: false);
    var syncViewModel = Provider.of<SyncViewModel>(context, listen: false);
    syncViewModel.synchronize(settings, true);
  }

  closeClientOverlay() {
    overlayEntry.remove();
    overlayEntry = null;
  }

  clearSearchField() {
    _searchBarController.clear();
  }

  Future displayClients(BuildContext mainContext, List<Client> clients,
      FocusNode searchFocusNode, Function clearSearchField) async {
    var overlayStack = Overlay.of(context);
    if (overlayEntry != null) {
      try {
        overlayEntry.remove();
      } catch (e) {
        print('overlayEntry cannot be removed');
      }
    }
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          top: 200,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.blue,
            child: ClientsList(
              clients: clients,
              clientsOverlayEntry: overlayEntry,
              focusNode: searchFocusNode,
              clearSearchField: clearSearchField,
              mainContext: mainContext,
            ),
          ));
    });
    overlayStack.insert(overlayEntry);
    overlayEntry.maintainState = true;
  }
}

class ClientsList extends StatefulWidget {
  final List<Client> clients;
  final OverlayEntry clientsOverlayEntry;
  final FocusNode focusNode;
  final Function clearSearchField;
  final BuildContext mainContext;

  ClientsList(
      {Key key,
      this.clients,
      this.clientsOverlayEntry,
      this.focusNode,
      this.clearSearchField,
      this.mainContext})
      : super(key: key);

  @override
  _ClientsListState createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  OverlayEntry sumToCollectOverlayEntry;
  TextEditingController _sumCollectedController = TextEditingController();
  FocusNode sumToCollectFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
//    sumToCollectFocus.requestFocus();
    final collectViewModel =
        Provider.of<CollectViewModel>(widget.mainContext, listen: false);
    if (widget.clients.isEmpty) {
      return Align(
          alignment: Alignment.topCenter,
          child: Text('Aucun client trouvé avec ce numéro',
              style: Theme.of(context).textTheme.title));
    } else {
      return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: widget.clients.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 7);
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                sumToCollectOverlayEntry = OverlayEntry(builder: (context) {
                  widget.focusNode.unfocus();
                  sumToCollectFocus.requestFocus();
                  return Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Opacity(
                              opacity: 0.9,
                              child: Container(color: Colors.blue))),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.4,
                        bottom: MediaQuery.of(context).size.height * 0.3,
                        left: 40,
                        right: 40,
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text('Saisissez la somme à collecter',
                                    style: Theme.of(context).textTheme.title),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  child: TextField(
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.number,
                                      style: Theme.of(context).textTheme.title,
                                      controller: _sumCollectedController,
                                      autofocus: true,
                                      focusNode: sumToCollectFocus,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Montant à collecter',
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      onSubmitted: (sum) {}),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  OutlineButton(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      color: Theme.of(context).primaryColor,
                                      child: Text('Annuler'),
                                      onPressed: () {
                                        sumToCollectOverlayEntry.remove();
                                        widget.focusNode.requestFocus();
                                      }),
                                  SizedBox(width: 24),
                                  RaisedButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('Collecter'),
                                    onPressed: () async {
                                      sumToCollectOverlayEntry.remove();
                                      widget.clientsOverlayEntry.remove();
                                      widget.focusNode.unfocus();
                                      widget.clearSearchField();
                                      final client = widget.clients[index];
                                      // todo change depot number please
                                      final collect = Collecte(
                                          null,
                                          client.id,
                                          client.agent,
                                          int.parse(
                                              _sumCollectedController.text),
                                          6);
                                      collectViewModel.saveCollect(collect);
                                    },
                                  ),
                                  SizedBox(width: 16)
                                ],
                              ),
                              SizedBox(height: 16)
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                });
                var overlayStak = Overlay.of(context);
                overlayStak.insert(sumToCollectOverlayEntry);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(0, 1),
                        blurRadius: 1,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text(widget.clients[index].numero,
                          style: Theme.of(context).textTheme.title),
//                      SizedBox(height: 10),
//                      Text(widget.clients[index].first_name + widget.clients[index].last_name, style: Theme.of(context).textTheme.subtitle)
                    ]),
                    Text(widget.clients[index].mise.toString(),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w800,
                            fontSize: 18))
                  ],
                ),
              ),
            );
          });
    }
  }
}

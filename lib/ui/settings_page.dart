import 'package:flutter/material.dart';
import 'package:mobile/core/view_models/settings_view_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsViewModel = Provider.of<SettingsViewModel>(context, listen: false);
//    var isEditing = false;
    var addressFieldController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(title: Text('Paramètres')),
      body: SettingsBody(addressFieldController: addressFieldController, settingsViewModel: settingsViewModel),
    );
  }
}

class SettingsBody extends StatefulWidget {
  const SettingsBody({
    Key key,
    @required this.addressFieldController,
    @required this.settingsViewModel,
  }) : super(key: key);

  final TextEditingController addressFieldController;
  final SettingsViewModel settingsViewModel;

  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {

  var isEditing = false;

  activateSaveButton(bool canActivate) {
    setState(() {
      isEditing = canActivate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Consumer<SettingsViewModel>(
            builder: (context, settingsViewModel, _) {
              widget.addressFieldController.text = settingsViewModel.serverAddress;
              return TextField(
                controller: widget.addressFieldController,
                onChanged: (text) {
//                  activateSaveButton(true);
                },
                decoration: InputDecoration(
                    hintText: 'http://192.168.1.1:3000',
                    labelText: 'Address du serveur',
                    border: OutlineInputBorder()
                ),
              );
            },
          ),
          RaisedButton(child: Text('Enrégistrer'), color: Theme.of(context).primaryColor, onPressed: () {
            widget.settingsViewModel.saveServerAdress(widget.addressFieldController.text);
//              activateSaveButton(false);
          })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions:<Widget>[IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Opciones',
          onPressed: () {
           
          },
        )],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Align(alignment: Alignment.bottomCenter, child: Text('INICIO')),
      ),
      body: new Container(
        child: new Text("Has iniciado sesión"),
      ),
    );
  }
}

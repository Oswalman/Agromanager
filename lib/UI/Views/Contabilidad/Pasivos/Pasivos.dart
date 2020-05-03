import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:Agromanager/UI/Views/Pasivos/TipoInsumo/TipoInsumo.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class Pasivos extends StatefulWidget {
  Pasivos({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new PasivosWidget();
}

class PasivosWidget extends State<Pasivos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: "Pasivos"),
        endDrawer: EndDrawer(context, widget.auth, widget.logoutCallback),
        drawer: DrawerWidget(
            context, widget.auth, widget.logoutCallback, widget.userId),
        body: Fondo(
            context,
            Stack(
              children: <Widget>[
                Center(
                    child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                      child: SizedBox(
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff053D02))),
                          color: Color(0xffFFFFFF).withOpacity(0.5),
                          textColor: Colors.black,
                          onPressed: () {},
                          child: Text('INSUMOS'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                      child: SizedBox(
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff053D02))),
                          color: Color(0xffFFFFFF).withOpacity(0.5),
                          textColor: Colors.black,
                          onPressed: () {},
                          child: Text('EQUIPOS'),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )));
  }
}

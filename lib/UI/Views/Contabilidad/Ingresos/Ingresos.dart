import 'package:Agromanager/UI/Views/Contabilidad/Ingresos/TipoExternos/TipoExternos.dart';
import 'package:Agromanager/UI/Views/Contabilidad/Ingresos/TipoVentas/TipoVentas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:Agromanager/UI/Views/Ingresos/TipoInsumo/TipoInsumo.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class Ingresos extends StatefulWidget {
  Ingresos({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new IngresosWidget();
}

class IngresosWidget extends State<Ingresos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: "INGRESOS"),
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
                          onPressed: () {
                            final route = MaterialPageRoute(builder: (context) {
                              return TipoVentas(
                                auth: widget.auth,
                                userId: widget.userId,
                                logoutCallback: widget.logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                          child: Text('VENTAS'),
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
                          onPressed: () {
                            final route = MaterialPageRoute(builder: (context) {
                              return TipoExternos(
                                auth: widget.auth,
                                userId: widget.userId,
                                logoutCallback: widget.logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                          child: Text('EXTERNOS'),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )));
  }
}

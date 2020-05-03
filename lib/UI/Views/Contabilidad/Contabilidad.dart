import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/UI/Views/Contabilidad/Activos/Activos.dart';
import 'package:Agromanager/UI/Views/Contabilidad/Pasivos/Pasivos.dart';
import 'package:Agromanager/UI/Views/Contabilidad/Gastos/Gastos.dart';
import 'package:Agromanager/UI/Views/Contabilidad/Ingresos/Ingresos.dart';

import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class Contabilidad extends StatefulWidget {
  Contabilidad({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new ContabilidadWidget();
}

class ContabilidadWidget extends State<Contabilidad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: "CONTABILIDAD"),
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
                              return Gastos(
                                auth: widget.auth,
                                userId: widget.userId,
                                logoutCallback: widget.logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                          child: Text('GASTOS'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: 
                          const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                      child: SizedBox(
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff053D02))),
                          color: Color(0xffFFFFFF).withOpacity(0.5),
                          textColor: Colors.black,
                          onPressed: () {
                            final route = MaterialPageRoute(builder: (context) {
                              return Ingresos(
                                auth: widget.auth,
                                userId: widget.userId,
                                logoutCallback: widget.logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                          child: Text('INGRESOS'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: 
                          const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                      child: SizedBox(
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff053D02))),
                          color: Color(0xffFFFFFF).withOpacity(0.5),
                          textColor: Colors.black,
                          onPressed: () {
                            final route = MaterialPageRoute(builder: (context) {
                              return Activos(
                                auth: widget.auth,
                                userId: widget.userId,
                                logoutCallback: widget.logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                          child: Text('ACTIVOS'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: 
                          const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                      child: SizedBox(
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff053D02))),
                          color: Color(0xffFFFFFF).withOpacity(0.5),
                          textColor: Colors.black,
                          onPressed: () {
                            final route = MaterialPageRoute(builder: (context) {
                              return Pasivos(
                                auth: widget.auth,
                                userId: widget.userId,
                                logoutCallback: widget.logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                          child: Text('PASIVOS'),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )));
  }
}

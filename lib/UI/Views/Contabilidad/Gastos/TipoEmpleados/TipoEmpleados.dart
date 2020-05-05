import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/core/models/tipoInsumoModel.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Agromanager/UI/Views/Contabilidad/Gastos/TipoEmpleados/AddTipoEmpleados.dart';
import 'package:Agromanager/UI/Views/Contabilidad/Gastos/TipoEmpleados/DetallesEmpleados.dart';

import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class TipoEmpleados extends StatefulWidget {
  TipoEmpleados({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  //---------------------------
  BaseAuth auth;
  VoidCallback logoutCallback;
  String userId;
  //---------------------------

  @override
  State<StatefulWidget> createState() => new TipoEmpleadosWidget();
}

class TipoEmpleadosWidget extends State<TipoEmpleados> {
  List<TipoInsumo> tipoInsumo;

  @override
  Widget build(BuildContext context) {
    final tipoProvider = Provider.of<CRUDTipoInsumo>(context);

    return Scaffold(
        appBar: AppbarWidget(title: "EMPLEADOS"),
        endDrawer: EndDrawer(context, widget.auth, widget.logoutCallback),
        drawer: DrawerWidget(
            context, widget.auth, widget.logoutCallback, widget.userId),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) {
              return AddTipoEmpleados(
                auth: widget.auth,
                userId: widget.userId,
                logoutCallback: widget.logoutCallback,
              );
            });
            Navigator.push(context, route);
          },
          child: Icon(Icons.add),
        ),
        body: Fondo(
          context,
          Container(
            child: StreamBuilder(
                stream: tipoProvider.fetchTipoInsumosAsStream(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    tipoInsumo = snapshot.data.documents
                        .map((doc) =>
                            TipoInsumo.fromMap(doc.data, doc.documentID))
                        .toList();
                    return ListView.builder(
                      itemCount: tipoInsumo.length,
                      itemBuilder: (buildContext, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetallesEmpleados(
                                      auth: widget.auth,
                                      userId: widget.userId,
                                      logoutCallback: widget.logoutCallback,
                                      tipoInsumo: tipoInsumo[index])));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          tipoInsumo[index].nombre,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Icon(Icons.chevron_right)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text('Consultando');
                  }
                }),
          ),
        ));
  }
}

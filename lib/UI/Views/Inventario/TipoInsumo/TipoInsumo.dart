import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/core/models/tipoInsumoModel.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Agromanager/UI/Views/Inventario/TipoInsumo/AddInsumo.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class TipoInsumoView extends StatefulWidget {
  TipoInsumoView({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  //---------------------------
  BaseAuth auth;
  VoidCallback logoutCallback;
  String userId;
  //---------------------------

  @override
  State<StatefulWidget> createState() => new TipoInsumoViewWidget();
}

class TipoInsumoViewWidget extends State<TipoInsumoView> {
  List<TipoInsumo> tipoInsumo;

  @override
  Widget build(BuildContext context) {
    final tipoProvider = Provider.of<CRUDTipoInsumo>(context);

    return Scaffold(
        appBar: AppbarWidget(title: "Tipo Insumo"),
        endDrawer: EndDrawer(context, widget.auth, widget.logoutCallback),
        drawer: DrawerWidget(
            context, widget.auth, widget.logoutCallback, widget.userId),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) {
              return AddInsumo(
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
                      itemBuilder: (buildContext, index) =>
                          Text(tipoInsumo[index].nombre),
                    );
                  } else {
                    return Text('Consultando');
                  }
                }),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/core/models/tipoInsumoModel.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import 'package:Agromanager/UI/Views/Home/Home.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Agromanager/UI/Views/Inventario/TipoInsumo/AddInsumo.dart';

class TipoInsumoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TipoInsumoViewWidget();
}

class TipoInsumoViewWidget extends State<TipoInsumoView> {
  List<TipoInsumo> tipoInsumo;

  @override
  Widget build(BuildContext context) {
    final tipoProvider = Provider.of<CRUDTipoInsumo>(context);

    return HomePage.layout(Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) {
            return AddInsumo();
          });
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: StreamBuilder(
            stream: tipoProvider.fetchTipoInsumosAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                tipoInsumo = snapshot.data.documents
                    .map((doc) => TipoInsumo.fromMap(doc.data, doc.documentID))
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

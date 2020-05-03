import 'package:flutter/material.dart';
import 'package:Agromanager/core/models/tipoInsumoModel.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import 'package:provider/provider.dart';
import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Views/Inventario/TipoInsumo/NewInsumo.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class DetallesInsumo extends StatefulWidget {
  DetallesInsumo(
      {Key key, this.auth, this.userId, this.logoutCallback, this.tipoInsumo})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  final TipoInsumo tipoInsumo;

  @override
  State<StatefulWidget> createState() => new DetallesInsumoWidget();
}

class DetallesInsumoWidget extends State<DetallesInsumo> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDTipoInsumo>(context);

    return Scaffold(
      appBar: AppbarWidget(title: "Inventario"),
      endDrawer: EndDrawer(context, widget.auth, widget.logoutCallback),
      drawer: DrawerWidget(
          context, widget.auth, widget.logoutCallback, widget.userId),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) {
            return NewInsumo(
              auth: widget.auth,
              userId: widget.userId,
              logoutCallback: widget.logoutCallback,
            );
          });
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }
}

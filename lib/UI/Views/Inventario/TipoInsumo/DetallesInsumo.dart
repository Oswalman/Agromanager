import 'package:flutter/material.dart';
import 'package:Agromanager/core/models/tipoInsumoModel.dart';
import 'package:Agromanager/core/models/producto.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import 'package:Agromanager/core/viewmodels/ProductoCrud.dart';
import 'package:provider/provider.dart';
import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Views/Inventario/TipoInsumo/NewInsumo.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return null;
  }
}

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
  List<Producto> producto;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDProducto>(context);

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
                  idTipoInsumo: widget.tipoInsumo.id);
            });
            Navigator.push(context, route);
          },
          child: Icon(Icons.add),
        ),
        body: Fondo(
          context,
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                  child: Material(
                    elevation: 40.0,
                    shadowColor: Colors.black,
                    child: TextField(
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                          icon: new Icon(Icons.search, color: Color(0xff224597)),
                          hintText: 'Busca tu item',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0))),
                    ),
                  )),
              StreamBuilder(
                  stream: productProvider
                      .fetchProductoWithCondition(widget.tipoInsumo.id),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      producto = snapshot.data.documents
                          .map((doc) =>
                              Producto.fromMap(doc.data, doc.documentID))
                          .toList();
                      return ListView.builder(
                        itemCount: producto.length,
                        itemBuilder: (buildContext, index) => GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
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
                                            producto[index].nombre,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 22,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Icon(Icons.edit),
                                          Icon(Icons.delete)
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
                  })
            ],
          ),
        ));
  }
}

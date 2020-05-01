import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/UI/Views/Home/Home.dart';
import 'package:Agromanager/UI/Views/Inventario/TipoInsumo/TipoInsumo.dart';

class Inventario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new InventarioWidget();
}

class InventarioWidget extends State<Inventario> {
  @override
  Widget build(BuildContext context) {
    return HomePage.layout(Stack(
      children: <Widget>[
        Center(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              child: SizedBox(
                height: 40.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff053D02))),
                  color: Color(0xffFFFFFF).withOpacity(0.5),
                  textColor: Colors.black,
                  onPressed: () {
                       final route = MaterialPageRoute(builder: (context){
                      return TipoInsumoView();
                    });
                    Navigator.push(context, route);
                  },
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
    )); 
  }
}

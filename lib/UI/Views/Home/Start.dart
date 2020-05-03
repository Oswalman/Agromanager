import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/UI/Views/Inventario/Inventario.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

class Start extends StatefulWidget {
  Start({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);


  BaseAuth auth;
  VoidCallback logoutCallback;
  String userId;

  @override
  State<StatefulWidget> createState() => new StartWidget();
}

class StartWidget extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    final route = MaterialPageRoute(builder: (context) {
                      return Inventario(
                        auth: widget.auth,
                        userId: widget.userId,
                        logoutCallback: widget.logoutCallback,
                      );
                    });
                    Navigator.push(context, route);
                  },
                  child: Text('INVENTARIO'),
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
                  child: Text('GASTOS'),
                ),
              ),
            ),
          ],
        )),
        Positioned(
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(40)),
                    color: Color(0xff2B4126),
                  ),
                  child: Column(children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Bienvenido a",
                            style: TextStyle(color: Colors.white))),
                    Align(
                        alignment: Alignment.center,
                        child: Text("Agromanager",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                height: 2,
                                fontSize: 20))),
                    Align(
                        alignment: Alignment.center,
                        child: Text("Plátano",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                height: 2,
                                fontSize: 20)))
                  ]),
                ))),
      ],
    );
  }
}

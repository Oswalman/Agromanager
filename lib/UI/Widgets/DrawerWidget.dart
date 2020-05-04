import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Agromanager/UI/Views/Terminos/Terminos.dart';
import 'package:Agromanager/UI/Views/Inventario/Inventario.dart';
import 'package:Agromanager/UI/Views/Home/Home.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

Widget DrawerWidget(BuildContext context, BaseAuth auth,
    VoidCallback logoutCallback, String userId) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment
                .bottomCenter, // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xFF638F6C),
              const Color(0xFF03240A)
            ], // whitish to gray
            tileMode: TileMode.clamp, // repeats the gradient over the canvas
          )),
          child: Column(
            children: <Widget>[
              Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Text('AGROMANAGER',
                        style: TextStyle(
                            color: Colors.white, height: 5, fontSize: 20))),
              ),
              Container(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Column(children: <Widget>[
                        ListTile(
                          leading: new Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            'INICIO',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            final route = MaterialPageRoute(builder: (context) {
                              return HomePage(
                                auth: auth,
                                userId: userId,
                                logoutCallback: logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                        ),
                        ListTile(
                          leading: new Icon(Icons.build, color: Colors.white),
                          title: Text('INVENTARIO',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                            final route = MaterialPageRoute(builder: (context) {
                              return Inventario(
                                auth: auth,
                                userId: userId,
                                logoutCallback: logoutCallback,
                              );
                            });
                            Navigator.push(context, route);
                          },
                        ),
                        ListTile(
                          leading:
                              new Icon(Icons.attach_money, color: Colors.white),
                          title: Text('GASTOS',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          leading:
                              new Icon(Icons.access_time, color: Colors.white),
                          title: Text('HISTORIAL',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ]))),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff000000).withOpacity(0.23)),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Column(
                                children: <Widget>[
                                  Divider(),
                                  ListTile(
                                      title: Text('¿QUIENES SOMOS?',
                                          style:
                                              TextStyle(color: Colors.white))),
                                  ListTile(
                                      title: Text('AYUDA',
                                          style:
                                              TextStyle(color: Colors.white))),
                                  ListTile(
                                    title: Text('TÉRMINOS Y CONDICIONES',
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      final route =
                                          MaterialPageRoute(builder: (context) {
                                        return Terminos();
                                      });
                                      Navigator.push(context, route);
                                    },
                                  ),
                                  Row(children: <Widget>[
                                    IconButton(
                                        icon: new Icon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          const url =
                                              'https://github.com/Oswalman';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                    IconButton(
                                        icon: new Icon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          const url =
                                              'https://github.com/Oswalman';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'No se pudo lanzar $url';
                                          }
                                        }),
                                    IconButton(
                                        icon: new Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          const url =
                                              'https://github.com/Oswalman';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'No se pudo lanzar  $url';
                                          }
                                        }),
                                    IconButton(
                                        icon: new Icon(
                                          FontAwesomeIcons.globeAmericas,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          const url =
                                              'http://agromanager.ddns.net';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'No se pudo lanzar  $url';
                                          }
                                        })
                                  ])
                                ],
                              )))))
            ],
          ),
        ),
      ],
    ),
  );
}

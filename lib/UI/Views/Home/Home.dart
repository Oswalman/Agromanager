import 'package:flutter/material.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: signOut)
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Align(alignment: Alignment.bottomCenter, child: Text('INICIO')),
      ),
      drawer: Drawer(
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
                tileMode:
                    TileMode.clamp, // repeats the gradient over the canvas
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
                      height: MediaQuery.of(context).size.height * 0.377,
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
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
                                // ...
                              },
                            ),
                            ListTile(
                              leading:
                                  new Icon(Icons.build, color: Colors.white),
                              title: Text('INVENTARIO',
                                  style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.attach_money,
                                  color: Colors.white),
                              title: Text('GASTOS',
                                  style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.access_time,
                                  color: Colors.white),
                              title: Text('HISTORIAL',
                                  style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                              },
                            ),
                          ]))),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xff000000).withOpacity(0.23)),
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: Column(
                            children: <Widget>[
                              Divider(),
                              ListTile(
                                  title: Text('¿QUIENES SOMOS?',
                                      style: TextStyle(color: Colors.white))),
                              ListTile(
                                  title: Text('AYUDA',
                                      style: TextStyle(color: Colors.white))),
                              ListTile(
                                  title: Text('TÉRMINOS Y CONDICIONES',
                                      style: TextStyle(color: Colors.white))),
                              Row(children: <Widget>[
                                IconButton(
                                    icon: new Icon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      const url = 'https://github.com/Oswalman';
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
                                      const url = 'https://github.com/Oswalman';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    }),
                                IconButton(
                                    icon: new Icon(
                                      FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      const url = 'https://github.com/Oswalman';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    }),
                                IconButton(
                                    icon: new Icon(
                                      FontAwesomeIcons.page4,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      const url = 'https://github.com/Oswalman';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    })
                              ])
                            ],
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Fondo_Global.png"),
                fit: BoxFit.cover)),
        child: new Text("Has iniciado sesión"),
      ),
    );
  }
}

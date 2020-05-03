import 'package:flutter/material.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';

Widget EndDrawer(
    BuildContext context, BaseAuth auth, VoidCallback logoutCallback) {
  signOut() async {
    try {
      auth.getCurrentUser().then((user) {
        print("-------------IDDDDD---------------");
        print(user?.uid);
      });

      await auth.signOut();
      logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  return Container(
    height: 100,
    child: Drawer(
      child: Container(
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
          child: ListView(children: <Widget>[
            ListTile(
              leading: new Icon(
                Icons.cancel,
              ),
              title:
                  Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
              onTap: () {
                signOut();
              },
            )
          ])),
    ),
  );
}

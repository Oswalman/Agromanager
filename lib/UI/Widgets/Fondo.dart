import 'package:flutter/material.dart';

Widget Fondo(BuildContext context, Widget fondo) {
  return  Stack(
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Fondo_Global.png"),
                fit: BoxFit.cover)),
        child: fondo,
      )
    ],
  );
}

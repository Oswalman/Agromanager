import 'package:flutter/material.dart';
import 'UI/Views/Login/Login.dart';

void main() => runApp(MaterialApp(
      routes: routes,
    ));

final routes = {
  '/': (BuildContext context) => new Login(),

};
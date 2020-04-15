import 'package:flutter/material.dart';
import 'UI/Views/Login/Login.dart';
import 'core/viewmodels/BaseAuth.dart';
import 'UI/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Agromanager',
        
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: new RootPage(auth: new Auth()));
  }
}

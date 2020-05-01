import 'package:flutter/material.dart';
import 'UI/Views/Login/Login.dart';
import 'core/viewmodels/BaseAuth.dart';
import 'UI/root_page.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import './locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MultiProvider(
        child: MaterialApp(
            title: 'Agromanager',
            debugShowCheckedModeBanner: false,
            theme: new ThemeData(
              primarySwatch: Colors.green,
            ),
            home: new RootPage(auth: new Auth())),
        providers: [
          ChangeNotifierProvider(builder: (_) => locator<CRUDTipoInsumo>()),
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Views/Home/Start.dart';

import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  HomePage.layout(this.layoutGen, this.titlePage);

  Widget layoutGen;
  BaseAuth auth;
  VoidCallback logoutCallback;
  String userId;
  String titlePage;

  @override
  State<StatefulWidget> createState() =>
      new _HomePageState(layoutGen: layoutGen);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({this.layoutGen});
  Widget layoutGen;

  @override
  void initState() {
    widget.titlePage = widget.titlePage != null ? widget.titlePage : 'Inicio';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppbarWidget(title: "Inicio"),
      endDrawer: EndDrawer(context, widget.auth, widget.logoutCallback),
      drawer: DrawerWidget(
          context, widget.auth, widget.logoutCallback, widget.userId),
      body: Fondo(
          context,
          Start(
            auth: widget.auth,
            userId: widget.userId,
            logoutCallback: widget.logoutCallback,
          )),
    );
  }
}

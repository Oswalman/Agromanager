import 'package:flutter/material.dart';

class AppbarWidget extends AppBar {
  AppbarWidget({Key key, String title})
      : super(
            key: key,
            title: Align(alignment: Alignment.bottomCenter, child: Text(title)),
            actions: <Widget>[
              Builder(
                  builder: (context) => new IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      }))
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ));
}

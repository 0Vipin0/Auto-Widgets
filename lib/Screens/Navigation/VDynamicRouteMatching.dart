import 'package:flutter/material.dart';

class VDynamicRouteMatching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.startsWith('/order')) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return OrderPage();
            },
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return NotFoundPage(name: settings.name);
          },
        );
      },
    );
  }
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NotFoundPage extends StatelessWidget {
  final String name;

  const NotFoundPage({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

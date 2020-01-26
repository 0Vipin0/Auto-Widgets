import 'package:flutter/material.dart';

class LoggingNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('push: ${_routeName(previousRoute)} ->${_routeName(route)}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print(' pop: ${_routeName(route)} -> ${_routeName(previousRoute)}');
  }

  String _routeName(Route<dynamic> route) {
    return route != null
        ? (route.settings?.name ?? route.runtimeType.toString())
        : 'null';
  }
}
class ObservedPage extends StatefulWidget {
  ObservedPage(this.routeObserver);
  final RouteObserver<PageRoute<dynamic>> routeObserver;
  @override
  _ObservedPageState createState() => _ObservedPageState(routeObserver);
}
class _ObservedPageState extends State<ObservedPage> with
    RouteAware {
  _ObservedPageState(this._routeObserver);
  final RouteObserver<PageRoute<dynamic>> _routeObserver;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }
  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }
  @override
  void didPush() {
    print('pushed');
  }
  @override
  void didPop() {
    print('popped');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Observed (Stateful)'),
      ),
    );
  }
}
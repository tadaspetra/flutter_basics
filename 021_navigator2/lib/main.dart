import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  MyRouterDelegate _delegate = MyRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: _delegate,
    );
  }
}

enum MyRoutes { first, second, third }

class MyRouteInformationParser extends RouteInformationParser<MyRoutes> {
  @override
  Future<MyRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case "/":
        return MyRoutes.first;
        break;
      case "/second":
        return MyRoutes.second;
        break;
      case "/third":
        return MyRoutes.third;
        break;
      default:
        return MyRoutes.first;
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutes configuration) {
    switch (configuration) {
      case MyRoutes.first:
        return const RouteInformation(location: '/');
      case MyRoutes.second:
        return const RouteInformation(location: '/second');
      case MyRoutes.third:
        return const RouteInformation(location: '/third');
    }
    throw 'unknown';
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutes>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutes> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoutes get configuration => _configuration;
  MyRoutes _configuration;
  set configuration(MyRoutes value) {
    if (_configuration == value) return;
    _configuration = value;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(MyRoutes configuration) async {
    _configuration = configuration;
  }

  // For web application
  @override
  MyRoutes get currentConfiguration => configuration;

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      _configuration = MyRoutes.first;
      notifyListeners();
    }
    return success;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        MaterialPage(key: ValueKey('first'), child: FirstPage()),
        if (configuration == MyRoutes.second)
          MaterialPage(key: ValueKey('second'), child: SecondPage()),
        if (configuration == MyRoutes.third)
          MaterialPage(key: ValueKey('third'), child: ThirdPage()),
      ],
      onPopPage: _handlePopPage,
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first')),
      body: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('go to second'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .configuration = MyRoutes.second;
            },
          )
        ],
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second')),
      body: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('go to third'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .configuration = MyRoutes.third;
            },
          )
        ],
      )),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('third')),
      body: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('go to second'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .configuration = MyRoutes.second;
            },
          )
        ],
      )),
    );
  }
}

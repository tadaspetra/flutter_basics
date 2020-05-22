import 'package:flutter/material.dart';
import 'package:flutter_web/layoutPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _bigDisplay() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Column 1"),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Column 2"),
            ],
          ),
        )
      ],
    );
  }

  Widget _smallDisplay() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Row 1"),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Row 2"),
            ],
          ),
        )
      ],
    );
  }

  void _goToLayout() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPage()));
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Responsive Layouts"), actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
          child: RaisedButton(
            onPressed: _goToLayout,
            child: Text("go to layout"),
          ),
        ),
      ]),
      body: Center(
        child: (_width > 500) ? _bigDisplay() : _smallDisplay(),
      ),
    );
  }
}

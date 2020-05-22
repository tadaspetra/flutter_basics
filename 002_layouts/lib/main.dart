import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Layouts"),
        centerTitle: true,
      ),
      // body: Column(
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: <Widget>[
      //         Text("1"),
      //         Text("2"),
      //         Text("3"),
      //       ],
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Expanded(child: Image.asset("images/lake.jpeg")),
      //         Expanded(
      //           child: Image.asset("images/person.jpg"),
      //           flex: 3,
      //         ),
      //         Expanded(child: Image.asset("images/tree.jpg")),
      //       ],
      //     ),
      //   ],
      // ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("ListTile"),
            subtitle: Text("i am a subtitle"),
            leading: Icon(Icons.access_alarm),
          ),
          Text("i am a list"),
          Text("in a listView"),
          Stack(
            children: <Widget>[
              Image.asset("images/tree.jpg"),
              Expanded(
                child: Text("hi"),
              )
            ],
          )
        ],
      ),
    );
  }
}

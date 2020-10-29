import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

void isolateFunction(int finalNum) {
  int _count = 0;

  for (int i = 0; i < finalNum; i++) {
    _count++;
    if ((_count % 100) == 0) {
      print("isolate: " + _count.toString());
    }
  }
}

int computeFunction(int finalNum) {
  int _count = 0;

  for (int i = 0; i < finalNum; i++) {
    _count++;
    if ((_count % 100) == 0) {
      print("compute: " + _count.toString());
    }
  }
  return _count;
}

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
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  @override
  void initState() {
    Isolate.spawn(isolateFunction, 1000);
    super.initState();
  }

  Future<void> runCompute() async {
    count = await compute(computeFunction, 2000);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolates Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(count.toString()),
            RaisedButton(
              child: Text("Add"),
              onPressed: () async {
                count++;
                setState(() {});
              },
            ),
            RaisedButton(
              child: Text("Add in Isolate"),
              onPressed: runCompute,
            ),
          ],
        ),
      ),
    );
  }
}

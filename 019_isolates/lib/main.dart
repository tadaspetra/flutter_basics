import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    runIsolate();
    runCompute();
    super.initState();
  }

  static void isolateFunction(int nothing) {
    int whileCount = 0;

    for (int i = 0; i < 1000; i++) {
      whileCount++;
      if ((whileCount % 100) == 0) {
        print("isolate: " + whileCount.toString());
      }
    }
  }

  static void computeFunction(int nothing) {
    int whileCount = 0;

    for (int i = 0; i < 1000; i++) {
      whileCount++;
      if ((whileCount % 88) == 0) {
        print("compute: " + whileCount.toString());
      }
    }
  }

  Future<void> runIsolate() async {
    Isolate.spawn(isolateFunction, 2);
  }

  Future<void> runCompute() async {
    compute(computeFunction, 20);
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
              onPressed: () {
                count++;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

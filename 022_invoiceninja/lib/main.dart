import 'package:flutter/material.dart';
import 'package:flutter_basics_debugging/screens/admin.dart';
import 'package:flutter_basics_debugging/screens/storefront.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice Ninja',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice Ninja Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Storefront Example"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyStoreFront()));
              },
            ),
            ElevatedButton(
              child: Text("Admin Example"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyAdmin()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

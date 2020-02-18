import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example File Structure"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 40),
            ),
            RaisedButton(
              child: Text("increment"),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
            RaisedButton(
              child: Text("decrement"),
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

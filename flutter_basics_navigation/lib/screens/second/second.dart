import 'package:flutter/material.dart';

class SecondArguments {
  final String passedString;
  final Text aText;

  SecondArguments({this.passedString, this.aText});
}

class Second extends StatefulWidget {
  final SecondArguments arguments;

  Second({
    this.arguments,
  });
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  void _goBack() {
    Navigator.pop(context, "hello from second page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Go Back"),
              onPressed: _goBack,
            ),
            Text(widget.arguments.passedString),
            widget.arguments.aText,
          ],
        ),
      ),
    );
  }
}

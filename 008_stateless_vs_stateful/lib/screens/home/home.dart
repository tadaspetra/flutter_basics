import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless vs. Stateful"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FirstColumn(),
          SecondColumn(),
        ],
      ),
    );
  }
}

class FirstColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("Like This: ")],
    );
  }
}

class SecondColumn extends StatefulWidget {
  @override
  _SecondColumnState createState() => _SecondColumnState();
}

class _SecondColumnState extends State<SecondColumn> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(liked ? Icons.star : Icons.star_border),
          onPressed: () {
            setState(() {
              liked = !liked;
            });
          },
        )
      ],
    );
  }
}

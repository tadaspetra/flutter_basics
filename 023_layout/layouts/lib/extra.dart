import 'package:flutter/material.dart';

class ExtraPage extends StatefulWidget {
  @override
  _ExtraPageState createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FractionallySizedBox(
        heightFactor: 1 / 2,
        widthFactor: 1 / 2,
        child: Container(
          color: Colors.blue,
        ),
      ),
      //   AspectRatio(
      // aspectRatio: 1 / 3,
      // child: Container(
      //   color: Colors.red,
      // ),
      // ),
    );
  }
}

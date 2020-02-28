import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Fonts"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "What's Up Creators",
                style: TextStyle(fontFamily: "tradewinds", fontSize: 30),
              ),
              Text(
                "What's Up Creators",
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

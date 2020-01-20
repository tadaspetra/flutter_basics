import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/second/second.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Object returnedFromSecond;

  // WITHOUT NAMED ROUTES
  // void _goToSecond() async {
  //   returnedFromSecond = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Second(
  //         passedString: "hello from home",
  //       ),
  //     ),
  //   );
  // }

  //WITH NAMED ROUTES
  void _goToSecond() async {
    returnedFromSecond = await Navigator.pushNamed(context, '/second',
        arguments: SecondArguments(passedString: "from arguments", aText: Text("hello everybody")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Go To Second"),
              onPressed: _goToSecond,
            ),
            Text("$returnedFromSecond")
          ],
        ),
      ),
    );
  }
}

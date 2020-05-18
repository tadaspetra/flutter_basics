import 'package:flutter/material.dart';
import 'package:reference/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _loadedScreen(String name) {
    return Text(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Database().getLocalName(),
          builder: (context, snapshot) {
            Widget retVal;
            if (snapshot.connectionState == ConnectionState.done) {
              retVal = _loadedScreen(snapshot.data);
            } else {
              retVal = CircularProgressIndicator();
            }
            return retVal;
          },
        ),
      ),
    );
  }
}

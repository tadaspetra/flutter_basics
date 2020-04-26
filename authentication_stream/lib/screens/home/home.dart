import 'package:flutter/material.dart';
import 'package:reference/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Sign Out"),
          onPressed: () {
            Auth().signOutUser();
          },
        ),
      ),
    );
  }
}

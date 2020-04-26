import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reference/screens/root.dart';
import 'package:reference/services/auth.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().user,
      child: MaterialApp(
        home: Root(),
      ),
    );
  }
}

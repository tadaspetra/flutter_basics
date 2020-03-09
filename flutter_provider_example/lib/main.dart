import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/following.dart';
import 'package:flutter_provider_example/screens/homeScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Following(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

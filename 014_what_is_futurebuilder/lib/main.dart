import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reference/screens/home.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notification(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Notification extends StatefulWidget {
  Notification({Key key}) : super(key: key);

  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

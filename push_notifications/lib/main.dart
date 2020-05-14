import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:reference/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notification(),
    );
  }
}

class Notification extends StatefulWidget {
  Notification({Key key}) : super(key: key);

  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notification> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
      _fcm.onIosSettingsRegistered.listen((event) {
        print("IOS Registered");
      });
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        //this callback happens when you are in the app and notification is received
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        //this callback happens when you launch app after a notification received
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        //this callbakc happens when you open the app after a notification received AND
        //app was running in the background
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

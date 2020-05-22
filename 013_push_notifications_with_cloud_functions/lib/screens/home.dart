import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:reference/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await DatePicker.showDateTimePicker(context, showTitleActions: true);
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(DateFormat.yMMMMd("en_US").format(_selectedDate)),
              Text(DateFormat("H:mm").format(_selectedDate)),
              FlatButton(
                child: Text("Change Date"),
                onPressed: () => _selectDate(context),
              ),
              RaisedButton(
                onPressed: () {
                  //create a notification document in firestore
                  Database().createNotification(whenToNotify: Timestamp.fromDate(_selectedDate));
                },
                child: Text("Create Notification"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

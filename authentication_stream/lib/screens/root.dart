import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reference/models/books.dart';
import 'package:reference/models/user.dart';
import 'package:reference/screens/home/home.dart';
import 'package:reference/screens/login/login.dart';
import 'package:reference/services/database.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);

    return (_user != null)
        ? StreamProvider<List<Book>>.value(value: Database().books, child: Home())
        : Login();
  }
}

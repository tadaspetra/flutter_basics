import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/following.dart';
import 'package:flutter_provider_example/screens/profileScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListTile eachTile(Following following, String name, String initials) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(initials),
      ),
      trailing: IconButton(
        icon: (following.followingList.contains(name)) ? Icon(Icons.check) : Icon(Icons.add),
        onPressed: () {
          if (following.followingList.contains(name)) {
            following.remove(name);
          } else {
            following.add(name);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              child: Text(
                "next",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              }),
        ],
      ),
      body: Consumer<Following>(
        builder: (BuildContext context, Following value, Widget child) {
          return ListView(
            children: <Widget>[
              eachTile(value, "Elon Musk", "EM"),
              eachTile(value, "Kanye West", "KW"),
              eachTile(value, "Kim Kardashian", "KK"),
              eachTile(value, "Kobe Bryant", "KB"),
              eachTile(value, "Tom Hanks", "TH"),
              eachTile(value, "Lebron James", "LJ"),
              eachTile(value, "Michael Jordan", "MJ"),
              eachTile(value, "Joe Rogan", "JR"),
              eachTile(value, "Selena Gomez", "SG"),
              eachTile(value, "Oprah Winfrey", "OW"),
            ],
          );
        },
      ),
    );
  }
}

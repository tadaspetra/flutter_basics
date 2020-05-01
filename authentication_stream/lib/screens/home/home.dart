import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reference/models/books.dart';
import 'package:reference/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Book> bookList = Provider.of<List<Book>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: (bookList != null)
          ? ListView.builder(
              itemCount: bookList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == bookList.length) {
                  return RaisedButton(
                    child: Text("Sign Out"),
                    onPressed: () {
                      Auth().signOutUser();
                    },
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(bookList[index].name),
                    ],
                  );
                }
              },
            )
          : Text("Loading"),
    );
  }
}

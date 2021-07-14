import 'dart:convert';

import 'package:djangoapp/create.dart';
import 'package:djangoapp/update.dart';
import 'package:djangoapp/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notes App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var client = http.Client();
  List<Note> notes = [];

  @override
  void initState() {
    retrieveContacts();
    super.initState();
  }

  void retrieveContacts() async {
    notes = [];
    List response = json.decode((await client.get(retrieveUrl)).body);
    response.forEach((element) {
      notes.add(Note.fromMap(element));
    });
    setState(() {});
  }

  void _deleteNote(int id) {
    client.delete(deleteUrl(id));
    retrieveContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          retrieveContacts();
        },
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(notes[index].note),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UpdatePage(client: client, index: notes[index].id, note: notes[index].note)),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => _deleteNote(notes[index].id),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CreatePage(client: client)),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

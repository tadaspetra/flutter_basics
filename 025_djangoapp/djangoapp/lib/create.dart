import 'package:djangoapp/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({Key? key, required this.client}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLines: 10,
            controller: controller,
            decoration: InputDecoration(hintText: "Add Note"),
          ),
          ElevatedButton(
            onPressed: () {
              widget.client.post(createUrl, body: {'body': controller.text});
              Navigator.pop(context);
            },
            child: Text("Create"),
          )
        ],
      ),
    );
  }
}

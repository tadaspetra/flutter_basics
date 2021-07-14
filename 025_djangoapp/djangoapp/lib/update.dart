import 'package:djangoapp/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdatePage extends StatefulWidget {
  final int index;
  final String note;
  final Client client;
  const UpdatePage({Key? key, required this.client, required this.index, required this.note}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    controller.text = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 10,
            decoration: InputDecoration(hintText: "Update Note"),
          ),
          ElevatedButton(
            onPressed: () {
              widget.client.put(updateUrl(widget.index), body: {'body': controller.text});
              Navigator.pop(context);
            },
            child: Text("Update"),
          )
        ],
      ),
    );
  }
}

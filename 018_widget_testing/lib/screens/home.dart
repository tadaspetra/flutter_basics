import 'package:flutter/material.dart';
import 'package:unit_testing/controllers/list_controller.dart';
import 'package:unit_testing/models/todo.dart';
import 'package:unit_testing/services/database.dart';
import 'package:unit_testing/widgets/todo_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _todoController = TextEditingController();
  ListController listController = ListController(database: Database());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List App"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: Key("addField"),
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    key: Key("addButton"),
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != "") {
                        listController
                            .addTodo(TodoModel(_todoController.text, false));
                        //Database()
                        //.addTodo(_todoController.text, controller.user.uid);
                        _todoController.clear();
                        setState(() {});
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            key: Key("loadFromDatabase"),
            child: Text("Load Todo from Database"),
            onPressed: () async {
              await listController.loadFromDatabase();
              setState(() {});
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listController.todoList.length,
              itemBuilder: (_, index) {
                return TodoCard(index: index, listController: listController);
              },
            ),
          )
        ],
      ),
    );
  }
}

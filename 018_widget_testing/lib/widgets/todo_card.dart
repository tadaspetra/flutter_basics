import 'package:flutter/material.dart';
import 'package:unit_testing/controllers/list_controller.dart';

class TodoCard extends StatefulWidget {
  final int index;
  final ListController listController;

  const TodoCard({Key key, this.index, this.listController}) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.listController.todoList[widget.index].content,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              key: Key("checkbox" + widget.index.toString()),
              value: widget.listController.todoList[widget.index].done,
              onChanged: (newValue) {
                widget.listController.checkboxSelected(newValue, widget.index);
                setState(() {});
                //Database().updateTodo(newValue, uid, todo.todoId);
              },
            ),
          ],
        ),
      ),
    );
  }
}

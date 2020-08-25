import 'package:unit_testing/models/todo.dart';
import 'package:unit_testing/services/database.dart';

class ListController {
  final Database database;
  List<TodoModel> todoList = List();

  ListController({this.database});

  void addTodo(TodoModel todo) {
    todoList.add(todo);
  }

  void checkboxSelected(bool newValue, int index) {
    todoList[index].done = newValue;
  }

  void clear() {
    todoList.clear();
  }

  Future<void> loadFromDatabase() async {
    todoList.add(await database.loadDatabase());
  }
}

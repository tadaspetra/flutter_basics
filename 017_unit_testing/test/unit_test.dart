import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing/controllers/list_controller.dart';
import 'package:unit_testing/models/todo.dart';
import 'package:unit_testing/services/database.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  final MockDatabase mockDatabase = MockDatabase();
  ListController _list;
  setUp(() {
    _list = ListController(database: mockDatabase);
  });

  tearDown(() {
    _list.clear();
  });

  test("Mock Database", () async {
    when(mockDatabase.loadDatabase())
        .thenAnswer((_) => Future.value(TodoModel("Mock Database", false)));

    await _list.loadFromDatabase();
    print("before expect");
    expect(_list.todoList[0].content, "Mock Database");
  });

  test("Empty List", () {
    expect(_list.todoList.length, 0);
  });

  test("addTodo", () {
    _list.addTodo(TodoModel("Get groceries", false));
    expect(_list.todoList.length, 1);
    expect(_list.todoList[0].content, "Get groceries");
    expect(_list.todoList[0].done, isNot(true));
  });

  test("checkboxSelected", () {
    _list.addTodo(TodoModel("Get groceries", false));
    expect(_list.todoList[0].done, isNot(true));

    _list.checkboxSelected(true, 0);
    expect(_list.todoList[0].done, true);
  });

  test("checkboxSelected", () {
    _list.addTodo(TodoModel("Get groceries", false));
    _list.clear();

    expect(_list.todoList.length, 0);
  });
}

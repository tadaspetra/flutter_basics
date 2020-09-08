import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing/controllers/list_controller.dart';
import 'package:unit_testing/models/todo.dart';
import 'package:unit_testing/services/database.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  MockDatabase _mockDatabase = MockDatabase();
  ListController _listController;
  setUp(() {
    _listController = ListController(database: _mockDatabase);
  });

  tearDown(() {
    _listController.clear(); //optional for this scenario
  });
  test("Initializes with empty", () {
    expect(_listController.todoList.length, 0);
  });

  test("Todo Added", () {
    _listController.addTodo(TodoModel("Get Groceries", false));
    expect(_listController.todoList.length, 1);
    expect(_listController.todoList[0].content, "Get Groceries");
  });

  test("Checkbox Selected", () {
    _listController.addTodo(TodoModel("Get Groceries", false));
    expect(_listController.todoList[0].done, false);
    _listController.checkboxSelected(true, 0);
    expect(_listController.todoList[0].done, true);
  });

  test("Mock Database call", () async {
    when(_mockDatabase.loadDatabase()).thenAnswer(
      (realInvocation) => Future.value(
        TodoModel("From Mock", true),
      ),
    );
    await _listController.loadFromDatabase();
    expect(_listController.todoList[0].content, "From Mock");
  });
}

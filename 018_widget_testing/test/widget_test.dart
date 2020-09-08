import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/screens/home.dart';

void main() {
  testWidgets("add a todo", (WidgetTester tester) async {
    //find all widgets needed
    final addField = find.byKey(ValueKey("addField"));
    final addButton = find.byKey(ValueKey("addButton"));

    //execute the actual test
    await tester.pumpWidget(MaterialApp(home: Home()));
    await tester.enterText(addField, "Make Widget Testing Video");
    await tester.tap(addButton);
    await tester.pump(); //rebuilds your widget

    //check outputs
    expect(find.text("Make Widget Testing Video"), findsOneWidget);
  });

  testWidgets("add from database", (WidgetTester tester) async {
    //find all widgets needed
    final loadFromDatabase = find.byKey(ValueKey("loadFromDatabase"));

    //execute the actual test
    await tester.pumpWidget(MaterialApp(home: Home()));
    await tester.tap(loadFromDatabase);
    await tester.pump(Duration(seconds: 2)); //rebuilds your widget

    //check outputs
    expect(find.text("From Database"), findsOneWidget);
  });
}

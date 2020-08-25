import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/screens/home.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Create the Finders.
    final addField = find.byKey(ValueKey("addField"));
    final addButton = find.byKey(ValueKey("addButton"));

    final messageFinder = find.text('Get Groceries');

    await tester.enterText(addField, 'Get Groceries');

    await tester.tap(addButton);

    await tester.pump(); //rebuilds

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(messageFinder, findsOneWidget);
  });
}

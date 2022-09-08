import 'package:flutter/material.dart';

// State
class CounteModel extends InheritedNotifier<CounterNotifier> {
  const CounteModel({
    super.key,
    super.notifier,
    required super.child,
  });

  static ValueNotifier<int> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounteModel>()!.notifier!.value;
  }
}

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    value = value + 1;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterState(),
    );
  }
}

class FlutterState extends StatelessWidget {
  const FlutterState({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CounteModel.of(context),
        builder: (context, counterValue, widget) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("No State Management"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$counterValue',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => CounteModel.of(context).val,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}

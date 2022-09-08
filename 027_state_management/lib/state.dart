import 'package:flutter/material.dart';
import 'package:state_management/riverpod.dart';

// State
class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    value = ++value;
  }
}

class FlutterState extends StatelessWidget {
  FlutterState({super.key});

  final CounterNotifier counter = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: counter,
        builder: (context, counterValue, widget) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter State"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const RiverpodState()),
                      );
                    },
                    child: const Text(
                      "Riverpod State ->",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
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
              onPressed: () => counter.add(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}

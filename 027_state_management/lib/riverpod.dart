import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    state = state + 1;
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class RiverpodState extends ConsumerWidget {
  const RiverpodState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    CounterNotifier counterNotifier = ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod State"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RiverpodState()),
                );
              },
              child: const Text("Flutter State"))
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
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterNotifier.add(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

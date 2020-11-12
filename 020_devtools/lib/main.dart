import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        children: <Widget>[
          OverflowScreen(),
          JankScreen(),
          PerformanceScreen(),
        ],
      ),
    );
  }
}

class OverflowScreen extends StatelessWidget {
  const OverflowScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DevTools Demo"),
      ),
      body: Center(
        child: Row(
          children: [
            Text(
                "Flutter is amazing, and Amateur Coder is the best teacher on the whole YouTube"),
          ],
        ),
      ),
    );
  }
}

class JankScreen extends StatelessWidget {
  const JankScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DevTools Demo"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == 20) return ExpensiveWidget();
            return Text("index:" + index.toString());
          },
          itemCount: 100,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 30,
            );
          },
        ));
  }
}

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    developer.log('are we having a good time?', name: 'amateur coder log');
    return Stack(
      children: [
        for (int i = 0; i < 1000; i++)
          Text(
            'index: 20',
          ),
      ],
    );
  }
}

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fibonacci(int n) {
      if (n < 2) {
        //base case
        return n;
      }
      return fibonacci(n - 2) + fibonacci(n - 1); //recursive case
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("DevTools Demo"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text("index:" + fibonacci(30).toString());
        },
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 30,
          );
        },
      ),
    );
  }
}

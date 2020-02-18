import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocpattern/screens/home/bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLoC"),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<CounterBloc>(context),
        builder: (BuildContext context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                RaisedButton(
                  child: Text("increment"),
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                ),
                RaisedButton(
                  child: Text("decrement"),
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

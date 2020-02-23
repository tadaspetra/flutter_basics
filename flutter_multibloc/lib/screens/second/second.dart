import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocpattern/blocs/counter/counter_bloc.dart';
import 'package:flutter_blocpattern/blocs/random/random_bloc.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int total = 0;

  CounterBloc counterBloc;

  _updateTotal() {
    setState(() {
      total = counterBloc.state.counter + BlocProvider.of<RandomBloc>(context).state.random;
    });
  }

  @override
  void didChangeDependencies() {
    counterBloc = BlocProvider.of<CounterBloc>(context);
    _updateTotal();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLoC"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MultiBlocListener(
            listeners: [
              BlocListener<CounterBloc, CounterState>(
                listener: (context, state) {
                  BlocProvider.of<RandomBloc>(context).add(GenerateRandom());
                  _updateTotal();
                },
              ),
              BlocListener<RandomBloc, RandomState>(
                listener: (context, state) {
                  _updateTotal();
                },
              )
            ],
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0), //counterBloc
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text(state.counter.toString());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text("+"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0), //randomBloc
                  child: BlocBuilder<RandomBloc, RandomState>(
                    builder: (context, state) {
                      return Text(state.random.toString());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text("="),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0), //total value of the two states
                  child: Text(total.toString()),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text("increment"),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                },
              ),
              Text(""),
              RaisedButton(
                child: Text("random"),
                onPressed: () {
                  BlocProvider.of<RandomBloc>(context).add(GenerateRandom());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

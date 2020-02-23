import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocpattern/blocs/counter/counter_bloc.dart';
import 'package:flutter_blocpattern/screens/second/second.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLoC"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("next"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SecondScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: BlocConsumer(
        bloc: BlocProvider.of<CounterBloc>(context),
        listener: (context, state) {
          print("State has changed");
          //add to navigate to different
          if (state.counter > 10) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Over 10"),
              duration: Duration(seconds: 1),
            ));
          }
        },
        builder: (context, state) {
          print("Widget has been built");
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
      // body: BlocListener(
      //   bloc: BlocProvider.of<CounterBloc>(context),
      //   listener: (BuildContext context, state) {
      //     print("State has changed");
      //     //add to navigate to different
      //     if (state.counter > 10) {
      //       Scaffold.of(context).showSnackBar(SnackBar(
      //         content: Text("Over 10"),
      //         duration: Duration(seconds: 1),
      //       ));
      //     }
      //   },
      //   child: BlocBuilder(
      //     bloc: BlocProvider.of<CounterBloc>(context),
      //     builder: (BuildContext context, state) {
      //       print("Widget has been built");
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Text(
      //               state.counter.toString(),
      //               style: TextStyle(fontSize: 40),
      //             ),
      //             RaisedButton(
      //               child: Text("increment"),
      //               onPressed: () {
      //                 BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
      //               },
      //             ),
      //             RaisedButton(
      //               child: Text("decrement"),
      //               onPressed: () {
      //                 BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
      //               },
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}

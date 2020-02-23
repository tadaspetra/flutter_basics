import 'package:flutter/material.dart';
import 'package:flutter_blocpattern/blocs/counter/counter_bloc.dart';
import 'package:flutter_blocpattern/blocs/random/random_bloc.dart';
import 'package:flutter_blocpattern/screens/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return CounterBloc();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return RandomBloc();
          },
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  @override
  RandomState get initialState => RandomState(random: 0);

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    if (event is GenerateRandom) {
      Random random = Random();
      int rand = random.nextInt(20);
      yield RandomState(random: rand);
    }
  }
}

part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DecrementEvent extends CounterEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

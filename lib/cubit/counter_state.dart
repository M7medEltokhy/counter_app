class CounterState {
  int counter;
  CounterState({required this.counter});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counter: 0);
}

class CounterIncrement extends CounterState {
  CounterIncrement({required super.counter});
}

class CounterDecrement extends CounterState {
  CounterDecrement({required super.counter});
}

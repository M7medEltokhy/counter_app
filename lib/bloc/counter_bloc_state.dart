class CounterBlocState {
  int counter;
  CounterBlocState({required this.counter});
}

class CounterBlocInitial extends CounterBlocState {
  CounterBlocInitial() : super(counter: 0);
}

class CounterBlocIncrement extends CounterBlocState {
  CounterBlocIncrement({required super.counter});
}

class CounterBlocDecrement extends CounterBlocState {
  CounterBlocDecrement({required super.counter});
}

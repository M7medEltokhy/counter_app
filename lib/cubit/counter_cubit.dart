import 'package:counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  void increment() {
    emit(CounterIncrement(counter: state.counter + 1));
  }

  void decrement() {
    emit(CounterDecrement(counter: state.counter - 1));
  }
}

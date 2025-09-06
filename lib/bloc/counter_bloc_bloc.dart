import 'package:counter/bloc/counter_bloc_event.dart';
import 'package:counter/bloc/counter_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(CounterBlocInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrementEvent) {
        emit(CounterBlocIncrement(counter: state.counter + 1));
      } else if (event is CounterDecrementEvent) {
        emit(CounterBlocDecrement(counter: state.counter - 1));
      }
    });
  }
}

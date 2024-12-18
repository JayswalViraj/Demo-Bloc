
import 'package:bloc_demo/counter/counter_event.dart';
import 'package:bloc_demo/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  static int counterBlocData = 0;
  CounterBloc() : super(InitialState(counterBlocData)) {
    int counterBlocData = 0;
    on<IncrementEvent>((event, emit) {
      counterBlocData++;

      emit(IncrementState(counterBlocData));
    });

    on<DecrementEvent>((event, emit) {
      counterBlocData--;
      emit(DecrementState(counterBlocData));
    });
  }
}

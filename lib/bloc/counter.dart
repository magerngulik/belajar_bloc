import 'package:bloc/bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) {
      emit(state + 1 * event.value);
    });

    on<Decrement>((event, emit) {
      emit(state - 1);
    });
  }
}

enum ThemeEvent { themeLight, themeDark }

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(true) {
    on<ThemeEvent>((event, emit) {
      if (event == ThemeEvent.themeDark) {
        emit(!state);
      }
    });
  }
}

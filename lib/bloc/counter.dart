import 'package:bloc/bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  add() => emit(state + 1);
  remove() => emit(state - 1);
}

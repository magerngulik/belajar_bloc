import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc() : super(true);
  changeTheme() => emit(!state);
}

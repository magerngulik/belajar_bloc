import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc() : super(false);
  changeTheme() => emit(!state);
}

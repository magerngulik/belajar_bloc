import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({"name": "no name", "age": 0});

  changeName(String newName) {
    emit({"name": newName, "age": state["age"]});
  }

  changeAge(int newAge) {
    emit({"name": state["name"], "age": newAge});
  }
}

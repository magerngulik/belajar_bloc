import 'package:bloc/bloc.dart';
import 'package:counter_apk_bloc/model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([])) {
    on<AddUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUser));
        state.allUser.add(event.user);
        emit(UserFinish(state.allUser));
      } catch (e) {
        emit(UserError(state.allUser));
      }
    });
    on<DeleteUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUser));
        state.allUser.removeWhere((element) => element == event.user);
        emit(UserFinish(state.allUser));
      } catch (e) {
        emit(UserError(state.allUser));
      }
    });
    on<EditUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUser));
        User seledtedUser =
            state.allUser.where((element) => element.id == event.user.id).first;
        seledtedUser.name = event.user.name;
        seledtedUser.age = event.user.age;
        emit(UserFinish(state.allUser));
      } catch (e) {
        emit(UserError(state.allUser));
      }
    });
  }
}

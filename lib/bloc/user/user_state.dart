part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  UserState(this.allUser);

  List<User> allUser;

  @override
  List<Object> get props => [allUser];
}

class UserInitial extends UserState {
  UserInitial(super.allUser);
}

class UserLoading extends UserState {
  UserLoading(super.allUser);
}

class UserFinish extends UserState {
  UserFinish(super.allUser);
}

class UserError extends UserState {
  UserError(super.allUser);
}

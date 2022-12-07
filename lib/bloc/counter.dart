// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int init;
  Counter({
    this.init = 0,
  }) : super(init);

  tambahData() {
    emit(state + 1);
  }

  kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}

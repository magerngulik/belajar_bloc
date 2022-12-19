import 'package:bloc/bloc.dart';
import 'package:counter_apk_bloc/bloc/user/user_bloc.dart';
import 'package:counter_apk_bloc/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial([])) {
    on<AddProductEvent>((event, emit) {});
  }
}

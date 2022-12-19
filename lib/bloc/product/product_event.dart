// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ProductEvent {
  AddProductEvent(this.product);
  final Product product;
}

class DeleteProductEvent extends ProductEvent {
  final Product product;
  DeleteProductEvent({
    required this.product,
  });
}

class EditProductEvent extends ProductEvent {
  final Product product;
  EditProductEvent({
    required this.product,
  });
}

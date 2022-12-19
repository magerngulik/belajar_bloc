part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  ProductState(this.listProduct);

  List<Product> listProduct;

  @override
  List<Object> get props => [listProduct];
}

class ProductInitial extends ProductState {
  ProductInitial(super.listProduct);
}

class ProductLoading extends ProductState {
  ProductLoading(super.listProduct);
}

class ProductFinish extends ProductState {
  ProductFinish(super.listProduct);
}

class ProductError extends ProductState {
  ProductError(super.listProduct);
}

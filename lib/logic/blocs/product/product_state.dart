part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoad extends ProductState {}

class ProductSuccess extends ProductState {
  final ProductEntity entity;

  ProductSuccess({required this.entity});

  @override
  List<Object> get props => [entity];
}

class ProductFailure extends ProductState {
  final String e;

  ProductFailure({required this.e});

  @override
  List<Object> get props => [e];
}

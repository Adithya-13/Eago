import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({
    required ProductRepository productRepository,
  })   : _productRepository = productRepository,
        super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if(event is ProductFetched){
      yield* _mapProductFetchedToState(event);
    }
  }

  Stream<ProductState> _mapProductFetchedToState(ProductFetched event) async* {
    yield ProductLoad();
    try{
      final ProductEntity entity = await _productRepository.getProductList();
      yield ProductSuccess(entity: entity);
    } catch(e){
      yield ProductFailure(e: e.toString());
    }
  }
}

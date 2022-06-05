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
  })  : _productRepository = productRepository,
        super(ProductInitial()) {
    on<ProductFetched>((event, emit) async {
      emit(ProductLoad());
      try {
        final entity = await _productRepository.getProductList();
        emit(ProductSuccess(entity: entity));
      } catch (e) {
        emit(ProductFailure(e: e.toString()));
      }
    });
  }
}
